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

# Standard wp-config.php file
# Enable WP_DEBUG and WP_DEBUG_LOG
echo 'create the file wp-config.php'
wp core config --dbname=$rep --dbuser=root --dbpass=root

cd wp-content/themes
git clone https://github.com/roots/roots.git

open http://localhost:8888/$rep
