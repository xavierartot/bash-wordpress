#! /bin/bash -e
# install wp et le theme Roots in local server MAMP

echo 'please, create your repertoire website'
read rep
mkdir -v $rep
cd $rep

echo 'downloading WordPress'
wp core download

echo 'create the database'
mysql -u root -p"root" -e "CREATE DATABASE \`$rep\`;"
#mysql -u root -p"$MYSQL_ROOT_PASS" -e "CREATE DATABASE \`$rep\`;"

# Standard wp-config.php file
# Enable WP_DEBUG and WP_DEBUG_LOG
wp core config --dbname=$rep --dbuser=root --dbpass=root

#install Wordpress
echo 'enter the website title, must have one word'
read title
echo 'enter the admin user, must have one word'
read admin_user
echo 'enter the admin password, must have 4 letters'
read admin_password
wp core install --url=http://localhost:8888/$rep/ --title=$title --admin_user=$admin_user --admin_password=$admin_password --admin_email=admin_email@gmail.fr

#install the theme roots and activate it
wp theme install https://github.com/roots/roots/archive/master.zip --activate

#list the themes installed
wp theme list
echo 'the theme was activate'

