# App Task
## Intro
Hi! This README.md will cover how to use vagrant in order to use a virtual machine and eventually access the app in browser. Simply read on to find out what you need in terms of software and how to connect to the VM! Enjoy

## Pre-requisites
Download all necessary software [Repo with all installations](https://github.com/khanmaster/vb_vagrant_installtion)
  - Virtual Box
  - Vagrant
  - Ruby
  - Code editor e.g. Atom, Sublime or Virtual Studio Code

Check versions in command/bash:
- `vagrant --version`
- `ruby --version`
- `git --version`
- 
## Instructions
**1.** Copy/fork the app files (starter code) into your own code editor.
   
**2.** In order to pass all the necessary tests to run the code we need to install all the relevant plugins, the commands for these need to be written within the VM and can be found below. In this example they are found in the `provision.sh` file which automates the process as the commands are immediately ran as soon as `vagrant up` is typed. These commands ensure the developer has all of the necessary software to run the code:

```ruby
#!/bin/bash
# Makes it so it runs it as a bash script --> decorator

# So this code is essentially automatically run in bash i.e. installs nginx
# so we can pass the tests for nginx!

# Update the sources list
sudo apt update -y

# Installs git
sudo apt-get install git -y

# Installs nodejs
sudo apt-get install python-software-properties -y
curl -sL https://deb.nodesource.com/setup_12.x | sudo -E bash -
sudo apt-get install nodejs -y

# Installs pm2
sudo npm install pm2 -g

# Installs nginx
sudo apt install nginx -y

# Install npm and run the app in the /app folder
cd /app
sudo apt install npm -y
npm install
npm start
```
**To test whether all the prerequisites are downloaded**
**1.** Navigate to the folder containing `Rakefile` in bash/command and download bundler -> `gem install bundler`
**2.** Then type in `bundle`
**3.** Then to initialise tests `rake spec`

**3.** Edited the vagrant file so that it will use the virtual box to run a virtual machine on any version you want (This case 16.0) and make sure that once it is run, it will run the bash commands written in 3. The file now includes the following code:
   
```ruby
# Installs all required plugins for vagrant to run
required_plugins = ["vagrant-hostsupdater"]
required_plugins.each do |plugin|
    exec "vagrant plugin install #{plugin}" unless Vagrant.has_plugin? plugin
end

Vagrant.configure("2") do |config|
  # Downloads a virtual machine box with a specific version of ubuntu that will be run in VM
  config.vm.box = "ubuntu/bionic64"

  # Sets the static IP address which can be accessed from browser
  config.vm.network "private_network", ip: "192.168.10.100"
  
  # config.hostsupdater.aliases = ["development.local"]

  # Syncs the folder in the code editor as well as the folder in VM so developer can edit code in either place. APP CODE GOES HERE
  config.vm.synced_folder "app", "/app"

  # Run provision script with relevant bash commands to ensure all software is downloaded and program can work
  config.vm.provision "shell", path: "environment/provision.sh"
end
```

**4.** All the user needs to do is navigate to the folder with the `Vagrantfile` in command/bash and `vagrant up` to initialise the virtual machine. 
- Other useful commands:
  - To suspend virtual machine `vagrant halt`
  - To shutdown the virtual machine `vagrant destroy` and can run it again with `vagrant up`
  - To go into the virtual machine `vagrant ssh` and it will act as commandline/bash, there you can edit as much as you want.  
  - `exit` to leave VM
  
**5.** To access the website with the application -> type `192.168.10.100` in your browser. 
- If want a more presentable URL -> uncomment `# config.hostsupdater.aliases = ["development.local"]` and type development.local in browser
  
**6.** To run the app, `vagrant ssh` into the VM and `npm install`.
Once it has finished downloading: `npm start` which will run the app. Then can go to `http://192.168.10.100:3000/` in the browser and all the relevant ports specified in the README within the app. A confirmation message should show `Your app is ready and listening on port 3000`
- `CTRL C` to leave the app in command/bash