#!/bin/bash
# Makes it so it runs it as a bash script --> decorator

# So this code is essentially automatically run in bash i.e. installs nginx
# so we can pass the tests for nginx!

# Update the sources list
sudo apt update -y

# Install git
sudo apt-get install git -y

# Install nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# Install pm2
sudo npm install pm2 -g

# Install nginx
sudo apt install nginx -y

# Install npm and run the app in the /app folder
cd /app
sudo apt install npm -y
sudo npm install
# npm start # Issue -> Holds up the terminal in usage

# pm2 start app.js
# Do some more actions!?!