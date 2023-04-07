#!/bin/bash

# Install HAproxy 1.5 or higher
sudo apt-get update
sudo apt-get install haproxy

# Configure HAproxy to accept SSL traffic and serve encrypted traffic
sudo cp /etc/haproxy/haproxy.cfg /etc/haproxy/haproxy.cfg.bak
sudo bash -c 'cat > /etc/haproxy/haproxy.cfg <<EOF
global
        ssl-default-bind-ciphers ECDHE-RSA-AES128-GCM-SHA256:ECDHE-ECDSA-AES128-GCM-SHA256:ECDHE-RSA-AES256-GCM-SHA384:ECDHE-ECDSA-AES256-GCM-SHA384:DHE-RSA-AES128-GCM-SHA256:DHE-DSS-AES128-GCM-SHA256:kEDH+AESGCM:ECDHE-RSA-AES128-SHA256:ECDHE-ECDSA-AES128-SHA256:ECDHE-RSA-AES128-SHA:ECDHE-ECDSA-AES128-SHA:ECDHE-RSA-AES256-SHA384:ECDHE-ECDSA-AES256-SHA384:ECDHE-RSA-AES256-SHA:ECDHE-ECDSA-AES256-SHA:DHE-RSA-AES128-SHA256:DHE-RSA-AES128-SHA:DHE-DSS-AES128-SHA256:DHE-RSA-AES256-SHA256:DHE-DSS-AES256-SHA:DHE-RSA-AES256-SHA:AES128-GCM-SHA256:AES256-GCM-SHA384:AES128-SHA256:AES256-SHA256:AES128-SHA:AES256-SHA:!3DES:!DH:!aNULL:!eNULL:!MD5:!RSA
        ssl-default-bind-options no-sslv3 no-tlsv10 no-tlsv11

defaults
        log     global
        mode    http
        option  httplog
        option  dontlognull
        option  forwardfor
        timeout connect 5s
        timeout client  1m
        timeout server  1m

frontend www-http
        bind *:80
        redirect scheme https if !{ ssl_fc }

frontend www-https
        bind *:443 ssl crt /etc/letsencrypt/live/www.waleadeosun.net/fullchain.pem
        http-request redirect scheme https unless { ssl_fc }
        default_backend www-backend

backend www-backend
        balance roundrobin
        server web-01 54.174.243.255 check
        server web-02 54.208.245.251 check
EOF'

# Install certbot and obtain SSL certificate for the domain
sudo apt-get update
sudo apt-get install certbot
sudo certbot certonly --standalone --agree-tos --email walephlp@gmail.com -d www.waleadeosun.net

# Update HAproxy configuration to use the SSL certificate
sudo sed -i "s#/etc/letsencrypt/live/www.waleadeosun.net/fullchain.pem#/etc/letsencrypt/live/www.waleadeosun.net/fullchain.pem\n    ssl crt /etc/letsencrypt/live/www.waleadeosun.net/privkey.pem#g" /etc/haproxy/haproxy.cfg

# Restart HAproxy
sudo service haproxy restart
