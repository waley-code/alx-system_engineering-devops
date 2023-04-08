#!/usr/bin/env bash
# If nginx is not being completely removed after uninstalling it, you can try the following steps to remove it completely:

# 1 Stop the nginx service if it is running:
sudo service nginx stop
# 2 Remove the nginx package and its dependencies:
sudo apt-get remove nginx nginx-common nginx-full -y
# 3 Remove the nginx configuration files:
sudo apt-get purge nginx nginx-common nginx-full -y
# 4 Remove any remaining nginx files:
sudo rm -rf /etc/nginx /var/www/nginx /var/log/nginx