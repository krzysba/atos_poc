#!/bin/bash

# sleep until instance is ready
until [[ -f /var/lib/cloud/instance/boot-finished ]]; do
  sleep 1
done

# install nginx
sudo yum update -y
sudo yum install httpd -y

# make sure nginx is started
sudo systemctl start httpd
sudo cp /tmp/index.html /var/www/html/index.html
