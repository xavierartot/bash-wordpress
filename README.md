Script bash for your workflow
============================

Install WordPress, Roots (WordPress Theme) on the Debian Web Server
------------------------------------------------------------------

file: wp-server-install.sh
I use this script, with wp-cli and the professionnal theme Roots:

wp-cli: http://wp-cli.org/

Theme Roots: https://github.com/roots/roots

1 - copy phpmyadmin in the work repertory

2 - create a database

3 - download WordPress

4 - create the wp-config.php for production work

5 - install WordPress

6 - install the theme Roots and activate it

7 - show your themes installed


Install WordPress, Roots(WordPress Theme) With a Server Web In Local
---------------------------------------------------------------------

I used wp-cli.
file: wp-local-complete-install.sh

install WordPress and the theme Roots in local for Mac and Linux, installing grunt ant configure it.
Create some post by default, with lorem...

You need to install wp-cli: http://wp-cli.org/
If you have some trouble with (wp-cli and MAMP): http://www.chefduweb.nl/2013/11/getting-wp-cli-to-work-with-mamp/
For use grunt, you need to install npm: https://www.npmjs.org/
line 36, I use the port 8888 with, you needed to change the port for Linux

Install WordPress The Server Web In Local
--------------------------------------

file: wp-local-partiel-install.sh

   CONTEXT
   installe Wordpress en local et le theme Roots sans la configuration.
   install Wordpress in local with the theme Roots without configuration.
   line 28, I use the port 8888 with MAMP, you needed to change the port on Linux
