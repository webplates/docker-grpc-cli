FROM alpine:3.7 as builder

RUN set -xe \
    && apk add --no-cache \
        autoconf \
        automake \
        build-base \
        cmake \
        git \
        libtool \
        zlib-dev

ARG GRPC_VERSION

RUN if [[ -z "$GRPC_VERSION" ]]; then echo "GRPC_VERSION argument MUST be set" && exit 1; fi

RUN git clone --depth 1 --recursive -b v${GRPC_VERSION} https://github.com/grpc/grpc.git /grpc

ENV LDFLAGS=-static

RUN cd /grpc/third_party/gflags \
    && mkdir build && cd build \
    && cmake -DBUILD_SHARED_LIBS=0 -DGFLAGS_INSTALL_SHARED_LIBS=0 .. \
    && make -j2 \
    && make install

RUN cd /grpc && make -j2 grpc_cli


FROM scratch
COPY --from=builder /grpc/bins/opt/grpc_cli /grpc_cli
COPY --from=builder /grpc/etc/roots.pem /usr/local/share/grpc/roots.pem

ENTRYPOINT ["/grpc_cli"]
CMD ["help"]
