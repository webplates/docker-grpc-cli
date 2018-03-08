# gRPC CLI Docker image

[![Build Status](https://img.shields.io/travis/webplates/docker-grpc-cli.svg?style=flat-square)](https://travis-ci.org/webplates/docker-grpc-cli)
[![Docker Image](https://img.shields.io/badge/docker%20image-webplates%2Fgrpc--cli-blue.svg?style=flat-square)](https://hub.docker.com/r/webplates/grpc-cli)

**Docker image wrapping [gRPC CLI](https://github.com/grpc/grpc/blob/master/doc/command_line_tool.md)**


## Usage

```bash
$ docker pull webplates/grpc-cli
$ docker run --rm -it webplates/grpc-cli
```

### Aliasing grpc_cli

```bash
$ alias grpc_cli='docker run --rm -it webplates/grpc-cli'
```


## Troubleshooting

### Getting `Method name not found` when calling to localhost

Since the tool runs inside a container, localhost does not actually mean the host computer.

On Linux you will have to find your host's IP address in the docker network and use that instead of `localhost` or `127.0.0.1`.

On [Mac](https://docs.docker.com/docker-for-mac/networking/#per-container-ip-addressing-is-not-possible) you can use the special `docker.for.mac.localhost` host which resolves to the host's internal IP address.


## License

The MIT License (MIT). Please see [License File](LICENSE) for more information.
