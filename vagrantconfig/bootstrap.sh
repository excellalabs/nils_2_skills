# update system references
apt-get update

# install build essentials for compilation
apt-get -y install build-essential

# install rvm & ruby
if [ ! -f /var/log/rubysetup ];
then
    cd /home/vagrant
    # install rvm
    su - vagrant -c "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
    su - vagrant -c "\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.5"
    su - vagrant -c "rvm --default use 2.1.5"
fi

# update bash file to include project specific settings
if [ ! -f /var/log/bashsetup ];
then
	BASH_FILE="~/.bashrc"
	BASH_UPDATES="/vagrant/vagrantconfig/bashrc.sh"
	su - vagrant -c "cat $BASH_UPDATES >> $BASH_FILE"
	touch /var/log/bashsetup
fi

# install ruby-dev package, node.js, sqlite3 dev tools
apt-get -y install ruby1.9.1-dev nodejs libsqlite3-dev

# install rails & sqlite 3 as vagrant user 
su - vagrant -c "gem install rails -v 4.1.6 --no-rdoc --no-ri"
su - vagrant -c "gem install sqlite3 -v '1.3.10' --no-rdoc --no-ri"

# system cleanup
apt-get -y autoremove