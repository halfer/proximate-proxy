#!/bin/sh

# Write to both stdout and a log file
echo "Teeing proxy logs also to $PROXY_LOG_PATH"
php /var/proxy/console/proxy-server.php | tee -a $PROXY_LOG_PATH
