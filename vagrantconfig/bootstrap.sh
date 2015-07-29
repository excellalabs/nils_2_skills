# update system references
apt-get update

# install build essentials for compilation
apt-get -y install build-essential

# ruby-install & chruby
if [ ! -f /var/log/rubysetup ];
then
    cd /home/vagrant
    # ruby-install pkg mgr (https://github.com/postmodern/ruby-install)
	wget -O ruby-install-0.5.0.tar.gz https://github.com/postmodern/ruby-install/archive/v0.5.0.tar.gz
	tar -xzf ruby-install-0.5.0.tar.gz
	su - vagrant -c "cd ruby-install-0.5.0; sudo make install"

	# install ruby 1.9.3 as vagrant user
	su - vagrant -c "ruby-install ruby 2.1.5 -- --disable-install-rdoc"
	#ruby-install --install-dir /home/vagrant ruby 1.9.3 -- --disable-install-rdoc

	# chruby version mgr (https://github.com/postmodern/chruby) 
	wget -O chruby-0.3.9.tar.gz https://github.com/postmodern/chruby/archive/v0.3.9.tar.gz
	tar -xzf chruby-0.3.9.tar.gz
	su - vagrant -c "cd chruby-0.3.9; sudo make install"

	touch /var/log/rubysetup

	# remove tar files to free space
	rm -f /home/vagrant/ruby-install-0.5.0.tar.gz
	rm -f /home/vagrant/chruby-0.3.9.tar.gz
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
su - vagrant -c "source /usr/local/share/chruby/chruby.sh; chruby ruby-2.1.5; gem install rails -v 4.1.6 --no-rdoc --no-ri"
su - vagrant -C "source /usr/local/share/chruby/chruby.sh; chruby ruby-2.1.5; gem install sqlite3 -v '1.3.10' --no-rdoc --no-ri"

# system cleanup
apt-get -y autoremove