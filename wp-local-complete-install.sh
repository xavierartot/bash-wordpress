echo 'please, create your repertoire website'
read rep
mkdir -v $rep
cd $rep

echo 'downloading WordPress'
wp core download

echo 'create the database'
mysql -u root -p"root" -e "CREATE DATABASE \`$rep\`;"

echo 'create the file wp-config.php'
wp core config --dbname=$rep --dbuser=root --dbpass=root <<PHP
define( 'WP_DEBUG', true );
define( 'WP_DEBUG_LOG', true );
define('WP_ENV', 'development');
PHP

#install Wordpress
TITLE='test'
ADMIN_USER='xav'
ADMIN_PASSWORD='xav'
EMAIL='xavierartot@gmail.com'
##read admin_email
echo TITLE
wp core install --url=http://localhost:8888/$rep --title=$TITLE --admin_user=$ADMIN_USER --admin_password=$ADMIN_PASSWORD --admin_email=$EMAIL
echo TITLE


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


wp theme install https://github.com/roots/sage/archive/master.zip 
wp theme activate sage-master
wp theme list

cd $PWD/wp-content/themes/sage-master
npm install 
bower install
gulp
