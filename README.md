# nils_2_skills
Professional development skill tracking application written in Ruby on Rails

Initial Setup:
  1. Download and install VirtualBox: https://www.virtualbox.org/
  2. Download and install Vagrant: https://www.vagrantup.com/
  3. Create a project directory and clone this repository
  4. From terminal enter the command "vagrant up" to create the vagrant box and run the install script
  5. After the vagrant box is created, enter 'vagrant ssh' to access the vagrant box from the terminal
  6. Enter 'cd /vagrant' to navigate to the vagrant folder (shared directory with your host machine that contains all the project/source files)

Once the vagrant machine has been configured and WEBrick has been started, to view the application in your browser, use localhost:8888 followed by the page route once rails is running. For example: http://localhost:8888/home. The port number can be changed in the Vagrantfile.

The vagrant machine's root password is 'vagrant'.

Additional useful vagrant commands:
* To exit the vagrant terminal session type 'exit'.
* To shut down the vagrant vm enter 'vagrant halt' at the command line.
* If any changes are made to the boostrap.sh file (such as adding additional components to the installation process), execute 'vagrant provision'.
* Use 'vagrant destroy' to shut down and delete the vagrant vm.

For more information on vagrant see: https://docs.vagrantup.com/v2/

The file .ruby_version sets the default ruby version for the folder that contains it using chruby. This box uses ruby-install and chruby to install and manage ruby 2.2.1. 

For more information about chruby and ruby-install see: https://github.com/postmodern/chruby  and  http://ryanbigg.com/2014/10/ubuntu-ruby-ruby-install-chruby-and-you//

