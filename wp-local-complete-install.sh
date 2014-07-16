#! /bin/bash -e
# install WordPress and the theme Roots in local for Mac and Linux, installing grunt ant configure it.
# You need to install wp-cli: http://wp-cli.org/
# If you have some trouble with (wp-cli and MAMP): http://www.chefduweb.nl/2013/11/getting-wp-cli-to-work-with-mamp/
# For use grunt, you need to install npm: https://www.npmjs.org/
# line 36, I use the port 8888 with, you needed to change the port for Linux

echo 'please, create your repertoire website'
read rep
mkdir -v $rep
cd $rep

echo 'downloading WordPress'
wp core download

echo 'create the database'
mysql -u root -p"root" -e "CREATE DATABASE \`$rep\`;"

# Standard wp-config.php file
# Enable WP_DEBUG and WP_DEBUG_LOG
echo 'create the file wp-config.php'
wp core config --dbname=$rep --dbuser=root --dbpass=root --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
PHP

#install Wordpress
echo 'enter the website title, must have one word'
read title
echo 'enter the admin user, must have one word'
read admin_user
echo 'enter the admin password, must have 4 letters'
read admin_password
echo 'enter the website email, must have email valid'
read admin_email
wp core install --url=http://localhost:8888/$rep --title=$title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email

#install the theme roots and activate it
wp theme install https://github.com/roots/roots/archive/master.zip --activate

# activate theme a roots"
wp theme activate roots-master
echo 'the theme was activate'

#list the themes installed
wp theme list

cd $PWD/wp-content/themes/roots-master
echo "move to the folder theme"
echo $PWD/wp-content/themes/roots-master

echo "install npm globally: npm install -g grunt"
echo "Enter your password system"
sudo npm install -g grunt-cli
rm -Rf node_modules
npm install

echo "start grunt: grunt"
grunt

grunt watch
