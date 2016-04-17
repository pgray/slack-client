#!/usr/bin/bash

[[ "$(docker ps -a | grep slack-data | wc -l)" == "0" ]] && docker run --name=slack-data --entrypoint=/bin/true slack-client

docker run -it \
  --net=host \
  --device /dev/snd \
  --device /dev/dri \
  -v /etc/localtime:/etc/localtime:ro \
  -v /tmp/.X11-unix:/tmp/.X11-unix \
  -e DISPLAY=unix$DISPLAY \
  -e "xauthcookie=$(xauth list)" \
  --volumes-from=slack-data \
  slack-client
