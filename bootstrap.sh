nodeVersion=v0.10.30

echo "Updating package index"
apt-get update -y -q

echo "Installing git/mongodb/php5/nginx/ruby"
apt-get install git build-essential mongodb htop vim nginx php5 php-pear php5-dev php5-fpm php5-curl php5-gd php5-mcrypt libcurl4-openssl-dev gem -y -q

echo "Installing node $nodeVersion"
wget --quiet http://nodejs.org/dist/$nodeVersion/node-$nodeVersion-linux-x64.tar.gz
tar -zxf node-$nodeVersion-linux-x64.tar.gz
mv node-$nodeVersion-linux-x64/ /opt/node/
ln -s /opt/node/bin/node /usr/bin/node
ln -s /opt/node/bin/npm /usr/bin/npm

echo "Installing global node packages with npm"
npm install -g nodemon
npm install -g grunt-cli
npm install -g bower
npm install -g gulp
npm install -g yo
#npm install -g express
#npm install -g sails
#npm install ... whatever you want

echo "Installing composer"
curl -sS https://getcomposer.org/installer | php
mv composer.phar /usr/local/bin/composer

echo "Installing php packages with pecl"
pecl install pecl_http
pecl install mongo
echo "extension=mongo.so" >> /etc/php5/fpm/php.ini
echo "extension=http.so" >> /etc/php5/fpm/php.ini

ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/cli/conf.d/20-mcrypt.ini
ln -s /etc/php5/mods-available/mcrypt.ini /etc/php5/fpm/conf.d/20-mcrypt.ini

echo "Installing compass with gem"
gem install compass

echo "Copying some nginx configuration files"
cp -fr /vagrant/extra_files/nginx/* /etc/nginx/

echo "Reloading php5-fpm et nginx services"
service php5-fpm reload
service nginx reload

echo "Done. Enjoy !"
