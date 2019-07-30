#!/bin/bash

###########################
######## CONSTANTS ########
###########################

# Colors
GREEN='\033[0;32m'
CYAN='\033[0;36m' 
RED='\033[0;31m'
YELLOW='\033[0;33m'
LIGHT_GREEN='\033[1;32m'
LIGHT_CYAN='\033[1;36m' 
LIGHT_RED='\033[1;31m'
LIGHT_YELLOW='\033[1;33m'
WHITE='\033[1;37m'
NO_COLOR='\033[0m'

# STYLES
BLINK='\033[5m'
BOLD='\033[1m'
NORMAL='\033[25m'
 
###########################
####### LOAD CONFIG #######
###########################

SCRIPTPATH=$(cd ${0%/*} && pwd -P)
source $SCRIPTPATH/installing.config

###########################
###### CLEAN WINDOW #######
###########################

clear

###########################
####### INFORMTAION #######
###########################

echo -e "\n\n\t\t\t${LIGHT_YELLOW}TONCHO INSTALLER${NO_COLOR}"
echo -e "\n${LIGHT_GREEN}"
echo -e "\t WORKING FOLDER: \t ${SCRIPTPATH}"
echo -e "\n${NO_COLOR}"
 
###########################
######### UPDATE  #########
###########################
 
echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} UPDATE REPOSITORIES.${NO_COLOR}"
echo -e "\t\t\t${LIGHT_RED} PLEASE ENTER THE SUDO PASSWORD.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get update

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} REPOSITORIES SUCCESSFUL UPDATED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
##### INSTALLING BASIC ####
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING BASIC PROGRAMS.${NO_COLOR}"
echo -e "\n\t\t${LIGHT_YELLOW}Guake${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Htop${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Nmap${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Software-properties-common${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Speedometer${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Tmux${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Vim${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Zsh${NO_COLOR}\n"
echo -e "\t\t\t${LIGHT_RED} PLEASE ENTER THE SUDO PASSWORD.${NO_COLOR}"
echo -e "\t\t\t${LIGHT_RED} AND ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get install guake htop nmap software-properties-common speedometer tmux vim zsh

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} REPOSITORIES SUCCESSFUL UPDATED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
########### TMUX ##########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} CONFIGURE TMUX.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

if ! mkdir -p $TMUX; then
	echo -e "----------------------------------------------------------------------------------------"
	echo -e "\t\t${LIGHT_RED}[!!ERROR!!] Cannot create tmux directory in $TMUX. Go and fix it!${NO_COLOR}"
	echo -e "----------------------------------------------------------------------------------------\n"
	exit 1;
fi;

sudo cp .tmux.conf $HOME.tmux.conf
sudo cp -R .tmux/ $TMUX

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} TMUX SUCCESSFUL CONFIGURED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
#### TMUX MEM CPU LOAD ####
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING TMUX PROGRAMS.${NO_COLOR}"
echo -e "\n\t\t${LIGHT_YELLOW}Cmake${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Gcc${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}G++${NO_COLOR}\n"
echo -e "\t\t\t${LIGHT_RED} ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get install cmake gcc g++

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} CONFIGURE TMUX MEM CPU LOAD MASTER.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

cd $SCRIPTPATH
cd tmux-mem-cpu-load-master/
cmake .
make .
su -
cd tmux-mem-cpu-load-master/
make install
logout

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} TMUX CPU LOAD MASTER SUCCESSFUL CONFIGURED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
######### APACHE  #########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALL APACHE 2.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get install apache2

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} APACHE 2 SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
######### PHP 5.6 #########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING PHP 5.6 PROGRAMS.${NO_COLOR}"
echo -e "\n\t\t${LIGHT_YELLOW}Php 5.6${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-cli ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-cgi ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-dev ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-gd ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-mcrypt ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-pgsql ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-mbstring ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-mysql ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php5.6-xml${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Php-pear ${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}libapache2-mod-php5.6$ {NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}zend-framework$ {NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Zend-framework-bin${NO_COLOR}\n"
echo -e "\t\t\t${LIGHT_RED} ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo add-apt-repository ppa:ondrej/php
sudo apt-get update
sudo apt-get install php5.6 php5.6-cli php5.6-cgi php5.6-dev php5.6-gd php5.6-mcrypt php5.6-pgsql php5.6-mbstring php5.6-mysql php5.6-xmlphp-pear libapache2-mod-php5.6 zend-framework zend-framework-bin

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} PHP 5.6 SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} CONFIGURE PHP 5.6.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo cp php.ini /etc/php/5.6/apache2/php.ini

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} PHP 5.6 SUCCESSFUL CONFIGURED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
########## MYSQL ##########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING MYSQL PROGRAMS.${NO_COLOR}"
echo -e "\n\t\t${LIGHT_YELLOW}Mysql-client${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Mysql-server${NO_COLOR}\n"
echo -e "\t\t\t${LIGHT_RED} ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get install mysql-client mysql-server

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} MYSQL SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
####### POSTGRESQL ########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING POSTGRESQL PROGRAMS.${NO_COLOR}"
echo -e "\n\t\t${LIGHT_YELLOW}Postgresql${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Postgresql-contrib${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Pgadmin3${NO_COLOR}\n"
echo -e "\t\t\t${LIGHT_RED} ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo vi /etc/apt/sources.list.d/pgdg.list
wget --quiet -O - https://www.postgresql.org/media/keys/ACCC4CF8.asc | sudo apt-key add -
sudo apt-get update
sudo apt-get install postgresql postgresql-contrib pgadmin3

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} POSTGRESQL SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
########## GIT ############
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALL GIT.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get install git openssh-client openssh-server
git config --global user.name "{$NAME}"
git config --global user.email $EMAIL

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} GIT SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
######## SSH KEY  #########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} GENERATE SSH KEY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

ssh-keygen -t rsa
vim $HOME.ssh/id_rsa.pub

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} SSH KEY SUCCESSFUL GENERATED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

############################
######### COMPOSER #########
############################
# https://getcomposer.org/ #
############################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALL COMPOSER.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
php -r "if (hash_file('SHA384', 'composer-setup.php') === '55d6ead61b29c7bdee5cccfb50076874187bd9f21f65d8991d46ec5cc90518f447387fb9f76ebae1fbbacf329e583e30') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;"
php composer-setup.php
sudo mv composer.phar /usr/local/bin/composer
php -r "unlink('composer-setup.php');"

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} COMPOSER SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

###########################
######### NodeJS ##########
###########################

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING NODEJS.${NO_COLOR}"
echo -e "\n\t\t${LIGHT_YELLOW}Nodejs${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Npm${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Default-jdk${NO_COLOR}"
echo -e "\t\t\t${LIGHT_RED} ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo apt-get install nodejs npm default-jdk

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} NODEJS SUCCESSFUL INSTALLED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} SYMBOLIC LINK NODEJS.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo ln -s /usr/bin/nodejs /usr/bin/node

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_GREEN} NODEJS SYMBOLIC LINK SUCCESSFUL CREATED.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

echo -e "----------------------------------------------------------------------------------------"
echo -e "\t\t\t${LIGHT_CYAN} INSTALLING GULP.${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Gulp${NO_COLOR}"
echo -e "\t\t${LIGHT_YELLOW}Gulp-cli${NO_COLOR}"
echo -e "\t\t\t${LIGHT_RED} ACCEPT IF IS NECESARY.${NO_COLOR}"
echo -e "----------------------------------------------------------------------------------------\n"

sudo npm install gulp gulp-cli -g

echo -e "\n\tMade with ${LIGHT_RED}${BOLD}<3${NORMAL}${NO_COLOR} by ${LIGHT_CYAN}Toncho${NO_COLOR} - Alton Bell Smythe\n"