# Installs a Nginx server

exec {'install':
provider => shell,
command => 'sudo apt-get -y update ; sudo apt-get -y install nginx ; echo "Hello World!" | sudo tee /var/www/html/index.html ; echo "Ceci n'est pas une page" | sudo tee /usr/share/nginx/html/404.html ; sudo sed -i "s/server_name _;/server_name _;\n\trewrite ^\/redirect_me https:\/\/github.com\/waley-code permanent;\n\terror_page 404 \/404.html;\n\tlocation = \/404.html {\n\t\troot \/usr\/share\/nginx\/html;\n\t\tinternal;\n\t}/" /etc/nginx/sites-available/default ; HOST_NAME=hostname ; HEAD="add_header X-Served-By $HOST_NAME;" ; sudo sed -i "/^http {/a $HEAD" /etc/nginx/nginx.conf ; sudo service nginx restart',
}