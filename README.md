# yakyak-docker
This dockerfile uses image debian:latest to build any stable version of yakyak Hangouts desktop client.

### What is yakyal?
yakyak is a Hangouts desktop client for macOS, Linux 32 / 64 and Windows 32 / 64

### Options

Building this image you can specify some options:

* Stable version to build
* UID for the user
* GID for the user

### How to build
There are 3 vars you need to specify on build.

* VER: Stable version available [on yakyak github](https://github.com/yakyak/yakyak/releases)
* UID: UID os user you run X on your system
* GID: GID os user you run X on your system

To specify this vars must user --build-args parameter on docker build.
Example:
```
docker build --no-cache -t yakyak --build-arg VER=1.5.7 --build-arg UID=1000 --build-arg GID=1000 .
```
### Before to run

You must to be secure you have configured your X to accept external connections , if your X not accept it container will not run.
You can check with xhost command.

### How to run

To run you must to create a docker-compose.yml with your preferences 
You can use docker-compose.example in repository.

Once you create docker-compose.yml file , only run :

```
docker-compose up
```
### Make persistent

To make persistent you need do two things:
1 Up container and login once on you account 
2 When your are logged must to copy folder *italic /home/user/.config/* on you local disk and make a persistent volume on docker.
  You can take example of yakyak volume configured on docker-compose.example


