#! /bin/bash -e
# CONTEXT
# installe Wordpress en local et le theme Roots sans la configuration.
# install Wordpress in local with the theme Roots without configuration.
# line 28, I use the port 8888 with, you needed to change the port on Linux

echo 'please, create your repertoire website'
read repertoire
mkdir $repertoire
cd $repertoire

#Download the file
wget http://wordpress.org/latest.tar.gz

#unpack
tar -xzvf latest.tar.gz

#move files out
mv wordpress/* .

# remove leftovers 
rm latest.tar.gz && rm -rf wordpress 

echo "Your website $repertoire is created" 
#open http://localhost:8888/public

mysql -u root -p"$MYSQL_ROOT_PASS" -e "CREATE DATABASE \`$repertoire\`;" 

open http://localhost:8888/$repertoire

cd wp-content/themes
git clone https://github.com/roots/roots.git
