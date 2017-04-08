# Docker command to launch system
#
# @todo Need to set up a file volume

docker run \
        -p 127.0.0.1:8081:8081 \
        proximate-proxy
