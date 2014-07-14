#! /bin/bash -e
# installe wordpress en local avec MAMP et le theme Root

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

