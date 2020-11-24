# Dev Environment for Sparta NodeJS Sample App

## Intro
This is a repo for the dev environment for Sparta NodeJS Sample App.

Follow the steps to setu your local development environment.

## Pre Requisites 
- Git
- Vagrant
- Virtual box
- Ruby
- Code editor e.g. Atom, Sublime, VSC

## Instructions
1. On the project root with vagrant file run in command/bash:
```bash
vagrant up

```
2. Once the process finishes, ssh into machine
   
```bash
vagrant ssh
```

3. Then go to /app and run npm
   
```bash
cd /app
sudo apt install npm -y
npm install
npm start
```
- We can add this code into the provision.sh file to automate running the app immediately after `vagrant up`

**To see app running**
Go to
```
development.local/3000 (or http://192.168.10.100:3000)
```
- or the other ports