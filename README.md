# sethgregory/rutorrent-autodl

Popular rtorrent client with a webui for ease of use [Rutorrent](https://github.com/Novik/ruTorrent), integrated with [autodl-irssi](https://github.com/autodl-community/autodl-irssi)

This container is based on the rutorrent docker container from the fantastic folks over at [LinuxServer.io](https://linuxserver.io)

## Usage

```
docker create --name=rutorrent-autodl \
-v <path to data>:/config \
-v <path to downloads>:/downloads \
-e PGID=<gid> -e PUID=<uid> -e TZ=<timezone> \
-p 80:80 -p 9527:9527/udp -p 45566-45576:45566-45576 \
sethgregory/rutorrent-autodl
```

**Parameters**

* `-p 80` - the port(s)
* `-p 45566-45576` - the port(s)
* `-p 9527/udp` - the port(s)
* `-v /config` - where rutorrent should store it's config files
* `-v /downloads` - path to your downloads folder
* `-e PGID` for GroupID - see below for explanation
* `-e PUID` for UserID - see below for explanation
* `-e TZ` for timezone information, eg Europe/London

### User / Group Identifiers

Sometimes when using data volumes (`-v` flags) permissions issues can arise between the host OS and the container. We avoid this issue by allowing you to specify the user `PUID` and group `PGID`. Ensure the data volume directory on the host is owned by the same user you specify and it will "just work" ™.

In this instance `PUID=1001` and `PGID=1001`. To find yours use `id user` as below:

```
  $ id <dockeruser>
    uid=1001(dockeruser) gid=1001(dockergroup) groups=1001(dockergroup)
```

## Setting up the application

Webui can be found at `<your-ip>:80` , configuration files are in /config/rtorrent.

`** Important note for unraid users or those running a webserver on port 80, change port 80 assignment
**`


## Updates

* Shell access whilst the container is running: `docker exec -it rutorrent-autodl /bin/bash`
* Upgrade to the latest version: `docker restart rutorrent-autodl`
* To monitor the logs of the container in realtime: `docker logs -f rutorrent-autodl`



## Versions

+ **13.04.2016:** Initial Release.
