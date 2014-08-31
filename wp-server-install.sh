#!/usr/bin/env bash
#I use this script, in Debian, with wp-cli and the professionnal theme roots.

echo 'please, your database name'
read dbName

#copy phpmyadmin in the directory, you can remove this line...
cp -Rf /var/www/phpmyadmin /home/$dbName/www/phpmyadmin

#create the password variables for the database
echo 'please, your password for the database'
read password

#create the database
mysql -u root -p"$password" -e "CREATE DATABASE \`$dbName\`;"

##Download the file
wp core download --allow-root

#create the wp-config.php for production work
wp core config --dbname=$dbName --dbuser=root --dbpass=$password --allow-root

#install Wordpress
echo 'enter the website url'
read url
echo 'enter the website title, must have one word'
read title
echo 'enter the admin user, must have one word'
read admin_user
echo 'enter the admin password, must have 4 letters'
read admin_password
echo 'enter the website email, must have email valid'
read admin_email
wp core install --url=$url --title=$title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email --allow-root

#install the theme roots and activate it
#wp theme install https://github.com/roots/roots/archive/master.zip --activate --allow-root

#list the themes installed
#wp theme list --allow-root
#echo 'the theme was activate'
# activate theme a roots"
#wp theme activate roots --allow-root

