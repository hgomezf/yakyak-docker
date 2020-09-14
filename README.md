# yakyak-docker
This dockerfile uses image debian:latest to build a docker image with a stable version of yakyak Hangouts desktop client and run using X on you system.
The image also include chromium browser to open files from yakyak.

### What is yakyak?
yakyak is a Hangouts desktop client for macOS, Linux 32 / 64 and Windows 32 / 64 build on node.js and atom

Take a look on [github](https://github.com/yakyak/yakyak)

![image yakyak](https://cloud.githubusercontent.com/assets/123929/16032313/cdba46c2-3204-11e6-912f-a72fef60563a.png)


### Image Features

* Select stable release from [yakyak github](https://github.com/yakyak/yakyak/releases)
* Supports sounds and notifications.
* Includes chromium browser to open files from yakyak.
* Set UID and GID for user on image ( must to match with user runs X on your system ).

### How to build
There are 3 vars you need to specify on build.

* VER: Stable version available [on yakyak github](https://github.com/yakyak/yakyak/releases)
* UID: UID os user you run X on your system
* GID: GID os user you run X on your system

To specify this vars must user --build-args parameter on docker build.
Example:

```
docker build --no-cache -t yakyak-1.5.9 --build-arg VER=1.5.9 --build-arg UID=1000 --build-arg GID=1000 .
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

To make persistent you need to do two things:

1. Up container and login once on you account 
2. When your are logged must to copy folder */home/user/.config/* on you local disk and make a persistent volume on docker.
   You can take example of yakyak volume configured on docker-compose.example


