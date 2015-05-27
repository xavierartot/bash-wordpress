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
# Enable WP_ENV, WP_DEBUG and WP_DEBUG_LOG
echo 'create the file wp-config.php'
wp core config --dbname=$rep --dbuser=root --dbpass=root --extra-php <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define( 'WP_ENV', development);
PHP

#install Wordpress
echo 'enter the website title (escape the space with "\")'
read title
echo 'enter the admin user'
read admin_user
echo 'enter the admin password'
read admin_password
echo 'enter the email valid'
read admin_email
wp core install --url=http://localhost:8888/$rep --title=$title --admin_user=$admin_user --admin_password=$admin_password --admin_email=$admin_email

#install the theme roots and activate it
wp theme install https://github.com/roots/sage/archive/master.zip --activate
#https://github.com/roots/roots/archive/master.zip --activate

#creation de post de 1 a 100
read -rp "You want som post by default (100 maximum): " post

if [[ $post = *[!0-9]* ]]; then  # if post contains any non-digits
    printf >&2 'Invalid input\n'
elif (( post < 0 || post > 100 )); then
    printf >&2 '%d is out of range (0-100)\n' "$post"
else
    #printf 'Creating post %d\n' "$post"
    curl http://loripsum.net/api/5 | wp post generate --post_content --count=$post
fi

# activate the theme a roots"
wp theme activate sage-master
echo 'the theme was activate'

#list the themes installed
wp theme list

cd $PWD/wp-content/themes/sage-master
#echo "move to the folder theme"
echo $PWD/wp-content/themes/sage-master

#echo 'Initialise git'
#git init

#echo "install npm globally: npm install -g grunt and bower"
#echo "Enter your password system"
#sudo npm install -g grunt-cli bower

# if you have some trouble with npm delete node_modules/
#rm -Rf node_modules
npm install && bower install

#echo "inti gulp"
#grunt dev

