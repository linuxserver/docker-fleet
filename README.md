[![linuxserver.io](https://raw.githubusercontent.com/linuxserver/docker-templates/master/linuxserver.io/img/linuxserver_medium.png)](https://linuxserver.io)

[![Blog](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Blog)](https://blog.linuxserver.io "all the things you can do with our containers including How-To guides, opinions and much more!")
[![Discord](https://img.shields.io/discord/354974912613449730.svg?style=flat-square&color=E68523&label=Discord&logo=discord&logoColor=FFFFFF)](https://discord.gg/YWrKVTn "realtime support / chat with the community and the team.")
[![Discourse](https://img.shields.io/discourse/https/discourse.linuxserver.io/topics.svg?style=flat-square&color=E68523&logo=discourse&logoColor=FFFFFF)](https://discourse.linuxserver.io "post on our community forum.")
[![Fleet](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Fleet)](https://fleet.linuxserver.io "an online web interface which displays all of our maintained images.")
[![GitHub](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver "view the source for all of our repositories.")
[![Open Collective](https://img.shields.io/opencollective/all/linuxserver.svg?style=flat-square&color=E68523&label=Supporters&logo=open%20collective&logoColor=FFFFFF)](https://opencollective.com/linuxserver "please consider helping us by either donating or contributing to our budget")

The [LinuxServer.io](https://linuxserver.io) team brings you another container release featuring :-

 * regular and timely application updates
 * easy user mappings (PGID, PUID)
 * custom base image with s6 overlay
 * weekly base OS updates with common layers across the entire LinuxServer.io ecosystem to minimise space usage, down time and bandwidth
 * regular security updates

Find us at:
* [Blog](https://blog.linuxserver.io) - all the things you can do with our containers including How-To guides, opinions and much more!
* [Discord](https://discord.gg/YWrKVTn) - realtime support / chat with the community and the team.
* [Discourse](https://discourse.linuxserver.io) - post on our community forum.
* [Fleet](https://fleet.linuxserver.io) - an online web interface which displays all of our maintained images.
* [GitHub](https://github.com/linuxserver) - view the source for all of our repositories.
* [Open Collective](https://opencollective.com/linuxserver) - please consider helping us by either donating or contributing to our budget

# [linuxserver/fleet](https://github.com/linuxserver/docker-fleet)

[![GitHub Stars](https://img.shields.io/github/stars/linuxserver/docker-fleet.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-fleet)
[![GitHub Release](https://img.shields.io/github/release/linuxserver/docker-fleet.svg?style=flat-square&color=E68523&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-fleet/releases)
[![GitHub Package Repository](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitHub%20Package&logo=github&logoColor=FFFFFF)](https://github.com/linuxserver/docker-fleet/packages)
[![GitLab Container Registry](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=GitLab%20Registry&logo=gitlab&logoColor=FFFFFF)](https://gitlab.com/Linuxserver.io/docker-fleet/container_registry)
[![Quay.io](https://img.shields.io/static/v1.svg?style=flat-square&color=E68523&label=linuxserver.io&message=Quay.io)](https://quay.io/repository/linuxserver.io/fleet)
[![MicroBadger Layers](https://img.shields.io/microbadger/layers/linuxserver/fleet.svg?style=flat-square&color=E68523)](https://microbadger.com/images/linuxserver/fleet "Get your own version badge on microbadger.com")
[![Docker Pulls](https://img.shields.io/docker/pulls/linuxserver/fleet.svg?style=flat-square&color=E68523&label=pulls&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/fleet)
[![Docker Stars](https://img.shields.io/docker/stars/linuxserver/fleet.svg?style=flat-square&color=E68523&label=stars&logo=docker&logoColor=FFFFFF)](https://hub.docker.com/r/linuxserver/fleet)
[![Build Status](https://ci.linuxserver.io/view/all/job/Docker-Pipeline-Builders/job/docker-fleet/job/master/badge/icon?style=flat-square)](https://ci.linuxserver.io/job/Docker-Pipeline-Builders/job/docker-fleet/job/master/)
[![](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/fleet/latest/badge.svg)](https://lsio-ci.ams3.digitaloceanspaces.com/linuxserver/fleet/latest/index.html)

[Fleet](https://github.com/linuxserver/fleet) provides an online web interface which displays a set of maintained images from one or more owned repositories.

[![fleet]()](https://github.com/linuxserver/fleet)

## Supported Architectures

Our images support multiple architectures such as `x86-64`, `arm64` and `armhf`. We utilise the docker manifest for multi-platform awareness. More information is available from docker [here](https://github.com/docker/distribution/blob/master/docs/spec/manifest-v2-2.md#manifest-list) and our announcement [here](https://blog.linuxserver.io/2019/02/21/the-lsio-pipeline-project/).

Simply pulling `linuxserver/fleet` should retrieve the correct image for your arch, but you can also pull specific arch images via tags.

The architectures supported by this image are:

| Architecture | Tag |
| :----: | --- |
| x86-64 | amd64-latest |
| arm64 | arm64v8-latest |
| armhf | arm32v7-latest |


## Usage

Here are some example snippets to help you get started creating a container.

### docker

```
docker create \
  --name=fleet \
  -e PUID=1000 \
  -e PGID=1000 \
  -e fleet_admin_authentication_type=DATABASE \
  -e fleet_database_url=jdbc:mariadb://<url>:3306/fleet \
  -e fleet_database_username=fleet_user \
  -e fleet_database_password=dbuserpassword \
  -e fleet_dockerhub_username=dockerhub_user \
  -e fleet_dockerhub_password=password \
  -e fleet_refresh_interval=60 `#optional` \
  -e fleet_admin_secret=randomstring `#optional` \
  -e fleet_admin_username=admin `#optional` \
  -e fleet_admin_password=secretpassword `#optional` \
  -e fleet_skip_sync_on_startup=true `#optional` \
  -p 8080:8080 \
  -v </path/to/appdata/config>:/config \
  --restart unless-stopped \
  linuxserver/fleet
```


### docker-compose

Compatible with docker-compose v2 schemas.

```
---
version: "2"
services:
  fleet:
    image: linuxserver/fleet
    container_name: fleet
    environment:
      - PUID=1000
      - PGID=1000
      - fleet_admin_authentication_type=DATABASE
      - fleet_database_url=jdbc:mariadb://<url>:3306/fleet
      - fleet_database_username=fleet_user
      - fleet_database_password=dbuserpassword
      - fleet_dockerhub_username=dockerhub_user
      - fleet_dockerhub_password=password
      - fleet_refresh_interval=60 #optional
      - fleet_admin_secret=randomstring #optional
      - fleet_admin_username=admin #optional
      - fleet_admin_password=secretpassword #optional
      - fleet_skip_sync_on_startup=true #optional
    volumes:
      - </path/to/appdata/config>:/config
    ports:
      - 8080:8080
    restart: unless-stopped
```

## Parameters

Container images are configured using parameters passed at runtime (such as those above). These parameters are separated by a colon and indicate `<external>:<internal>` respectively. For example, `-p 8080:80` would expose port `80` from inside the container to be accessible from the host's IP on port `8080` outside the container.

| Parameter | Function |
| :----: | --- |
| `-p 8080` | Http port |
| `-e PUID=1000` | for UserID - see below for explanation |
| `-e PGID=1000` | for GroupID - see below for explanation |
| `-e fleet_admin_authentication_type=DATABASE` | A switch to define how Fleet manages user logins. If set to DATABASE, see the related optional params. Can be set to either DATABASE or PROPERTIES. |
| `-e fleet_database_url=jdbc:mariadb://<url>:3306/fleet` | The full JDBC connection string to the Fleet database |
| `-e fleet_database_username=fleet_user` | The username with the relevant GRANT permissions for the database |
| `-e fleet_database_password=dbuserpassword` | The database user's password. |
| `-e fleet_dockerhub_username=dockerhub_user` | The username of a member of your repository's owners team. This is used to get the list of your (and only your) namespaces in Docker Hub. |
| `-e fleet_dockerhub_password=password` | The password for the Docker Hub user. |
| `-e fleet_refresh_interval=60` | The time in minutes for how often Fleet should scan the Docker Hub repositories. |
| `-e fleet_admin_secret=randomstring` | A string used as part of the password key derivation process. Not mandatory. Only used if authentication type is set to DATABASE. |
| `-e fleet_admin_username=admin` | The name of the sole admin user, if authentication type is set to PROPERTIES. |
| `-e fleet_admin_password=secretpassword` | The password for the sole admin user, if authentication type is set to PROPERTIES. |
| `-e fleet_skip_sync_on_startup=true` | A flag to tell the app not to run an initial synchronisation process when it starts up |
| `-v /config` | The primary config file and rolling log files. |


## Environment variables from files (Docker secrets)

You can set any environment variable from a file by using a special prepend `FILE__`. 

As an example:

```
-e FILE__PASSWORD=/run/secrets/mysecretpassword
```

Will set the environment variable `PASSWORD` based on the contents of the `/run/secrets/mysecretpassword` file.

## User / Group Identifiers

When using volumes (`-v` flags) permissions issues can arise between the host OS and the container, we avoid this issue by allowing you to specify the user `PUID` and group `PGID`.

Ensure any volume directories on the host are owned by the same user you specify and any permissions issues will vanish like magic.

In this instance `PUID=1000` and `PGID=1000`, to find yours use `id user` as below:

```
  $ id username
    uid=1000(dockeruser) gid=1000(dockergroup) groups=1000(dockergroup)
```


&nbsp;
## Application Setup

Navigate to `http://your_ip_here:8080` to display the home page. If `DATABASE` is selected as the preferred authentication process, ensure that you set up an
initial user via `http://your_ip_here:8080/setup`. Once done, that page will no longer be available. A restart is preferable as it will remove the page altogether.
Once complete, you can log into the app via `http://your_ip_here:8080/login` to manage your repositories.



## Support Info

* Shell access whilst the container is running: `docker exec -it fleet /bin/bash`
* To monitor the logs of the container in realtime: `docker logs -f fleet`
* container version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' fleet`
* image version number
  * `docker inspect -f '{{ index .Config.Labels "build_version" }}' linuxserver/fleet`

## Updating Info

Most of our images are static, versioned, and require an image update and container recreation to update the app inside. With some exceptions (ie. nextcloud, plex), we do not recommend or support updating apps inside the container. Please consult the [Application Setup](#application-setup) section above to see if it is recommended for the image.

Below are the instructions for updating containers:

### Via Docker Run/Create
* Update the image: `docker pull linuxserver/fleet`
* Stop the running container: `docker stop fleet`
* Delete the container: `docker rm fleet`
* Recreate a new container with the same docker create parameters as instructed above (if mapped correctly to a host folder, your `/config` folder and settings will be preserved)
* Start the new container: `docker start fleet`
* You can also remove the old dangling images: `docker image prune`

### Via Docker Compose
* Update all images: `docker-compose pull`
  * or update a single image: `docker-compose pull fleet`
* Let compose update all containers as necessary: `docker-compose up -d`
  * or update a single container: `docker-compose up -d fleet`
* You can also remove the old dangling images: `docker image prune`

### Via Watchtower auto-updater (especially useful if you don't remember the original parameters)
* Pull the latest image at its tag and replace it with the same env variables in one run:
  ```
  docker run --rm \
  -v /var/run/docker.sock:/var/run/docker.sock \
  containrrr/watchtower \
  --run-once fleet
  ```

**Note:** We do not endorse the use of Watchtower as a solution to automated updates of existing Docker containers. In fact we generally discourage automated updates. However, this is a useful tool for one-time manual updates of containers where you have forgotten the original parameters. In the long term, we highly recommend using Docker Compose.

* You can also remove the old dangling images: `docker image prune`

## Building locally

If you want to make local modifications to these images for development purposes or just to customize the logic:
```
git clone https://github.com/linuxserver/docker-fleet.git
cd docker-fleet
docker build \
  --no-cache \
  --pull \
  -t linuxserver/fleet:latest .
```

The ARM variants can be built on x86_64 hardware using `multiarch/qemu-user-static`
```
docker run --rm --privileged multiarch/qemu-user-static:register --reset
```

Once registered you can define the dockerfile to use with `-f Dockerfile.aarch64`.

## Versions

* **19.12.19:** - Rebasing to alpine 3.11.
* **02.07.19:** - Rebasing to alpine 3.10.
* **02.07.19:** - Stop container if fleet fails.
* **19.05.19:** - Use new base images for arm versions.
* **01.04.19:** - Initial Release
