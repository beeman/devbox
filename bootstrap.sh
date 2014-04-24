nodeVersion=v0.11.12

echo "Mise à jour des dépôts"
apt-get update -y -q

echo "Installation des packages git/mongodb/php5/nginx/ruby"
apt-get install git build-essential mongodb htop vim nginx php5 php-pear php5-dev php5-fpm php5-curl php5-gd php5-mcrypt libcurl4-openssl-dev gem -y -q

echo "Installation de nodejs $nodeVersion"
wget --quiet http://nodejs.org/dist/$nodeVersion/node-$nodeVersion-linux-x64.tar.gz
tar -zxf node-$nodeVersion-linux-x64.tar.gz
mv node-$nodeVersion-linux-x64/ /opt/node/
ln -s /opt/node/bin/node /usr/bin/node
ln -s /opt/node/bin/npm /usr/bin/npm

echo "Installation de packages node"
npm install -g grunt-cli
npm install -g bower
npm install -g gulp
npm install -g yo
#npm install -g express
#npm install -g sails
#npm install ... whatever you want

echo "Installation de composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "Installation de packages php"
pecl install pecl_http
pecl install mongo
echo "extension=mongo.so" >> /etc/php5/fpm/php.ini
echo "extension=http.so" >> /etc/php5/fpm/php.ini

echo "installation de compass"
gem install compass

echo "Copie de fichiers de configuration"
cp -fr /vagrant/extra_files/nginx/* /etc/nginx/

echo "Rechargement des services php5-fpm et nginx"
service php5-fpm reload
service nginx reload
