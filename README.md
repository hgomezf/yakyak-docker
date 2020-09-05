# yakyak-docker
Dockerfile to build any version of yakyak Hangouts desktop client.

### About
This dockerfile uses image debian:latest to build any version of yakyak Hangouts desktop client.

### What is yakyal?
yakyak is a Hangouts desktop client for macOS, Linux 32 / 64 and Windows 32 / 64

### How to build
There are 3 vars you need to specify on build.

* Version: Version available [on yakyak github](https://github.com/yakyak/yakyak/releases)
* UID: UID os user you run X on your system
* GID: GID os user you run X on your system

To specify this vars must user --build-args parameter on docker build.
Example:
```
docker build --no-cache -t yakyak --build-arg VER=1.5.7 --build-arg UID=1000 --build-arg GID=1000 .
```
