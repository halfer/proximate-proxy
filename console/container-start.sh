#!/bin/sh

# Write to both stdout and a log file
echo "Teeing proxy logs also to $PROXY_LOG_PATH"
php console/proxy-server.php | tee --append $PROXY_LOG_PATH
