# Docker command to launch system
#
# When run standalone in Docker, the proxy logs to stdout

# Get the FQ path of this project
STARTDIR=`pwd`
cd `dirname $0`
ROOTDIR=`pwd`

# This run command maps a cache folder on the host to a
# mapped drive in the container
docker run \
    -p 127.0.0.1:8081:8081 \
    -v ${ROOTDIR}/cache:/remote/cache \
    -e PROXY_LOG_PATH=${ROOTDIR}/proxy.log \
    proximate-proxy

# Go back to original dir
cd $STARTDIR
