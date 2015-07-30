# update system references
apt-get update

# install build essentials for compilation
apt-get -y install build-essential

# install rvm & ruby
if [ ! -f /var/log/rubysetup ];
then
    cd /home/vagrant
    su - vagrant -c "gpg --keyserver hkp://keys.gnupg.net --recv-keys 409B6B1796C275462A1703113804BB82D39DC0E3"
    su - vagrant -c "\curl -sSL https://get.rvm.io | bash -s stable --ruby=2.1.5"
    su - vagrant -c "rvm --default use 2.1.5"
fi

# Edit the following to change the name of the database user that will be created:
APP_DB_USER=developer
APP_DB_PASS=developer

# Edit the following to change the name of the database that is created (defaults to the user name)
APP_DB_NAME=nils_2_skills
APP_DB_NAME_DEV=nils_2_skills_dev
APP_DB_NAME_TEST=nils_2_skills_test

# Edit the following to change the version of PostgreSQL that is installed
PG_VERSION=9.3

###########################################################
# Changes below this line are probably not necessary
###########################################################
print_db_usage () {
  echo "Your PostgreSQL database has been setup and can be accessed on your local machine on the forwarded port (default: 15432)"
  echo "  Host: localhost"
  echo "  Port: 5432"
  echo "  Database: $APP_DB_NAME"
  echo "  Username: $APP_DB_USER"
  echo "  Password: $APP_DB_PASS"
  echo ""
  echo "Admin access to postgres user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo ""
  echo "psql access to app database user via VM:"
  echo "  vagrant ssh"
  echo "  sudo su - postgres"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost $APP_DB_NAME"
  echo ""
  echo "Env variable for application development:"
  echo "  DATABASE_URL=postgresql://$APP_DB_USER:$APP_DB_PASS@localhost:5432/$APP_DB_NAME"
  echo ""
  echo "Local command to access the database via psql:"
  echo "  PGUSER=$APP_DB_USER PGPASSWORD=$APP_DB_PASS psql -h localhost -p 5432 $APP_DB_NAME"
}

export DEBIAN_FRONTEND=noninteractive

PROVISIONED_ON=/etc/vm_provision_on_timestamp
if [ -f "$PROVISIONED_ON" ]
then
  echo "VM was already provisioned at: $(cat $PROVISIONED_ON)"
  echo "To run system updates manually login via 'vagrant ssh' and run 'apt-get update && apt-get upgrade'"
  echo ""
  print_db_usage
  exit
fi

PG_REPO_APT_SOURCE=/etc/apt/sources.list.d/pgdg.list
if [ ! -f "$PG_REPO_APT_SOURCE" ]
then
  # Add PG apt repo:
  echo "deb http://apt.postgresql.org/pub/repos/apt/ precise-pgdg main" > "$PG_REPO_APT_SOURCE"

  # Add PGDG repo key:
  wget --quiet -O - http://apt.postgresql.org/pub/repos/apt/ACCC4CF8.asc | apt-key add -
fi

# Update package list and upgrade all packages
apt-get update
apt-get -y upgrade

# Install postgresql & postgresql library
apt-get -y install "postgresql-$PG_VERSION" "postgresql-contrib-$PG_VERSION"
apt-get -y install libpq-dev

PG_CONF="/etc/postgresql/$PG_VERSION/main/postgresql.conf"
PG_HBA="/etc/postgresql/$PG_VERSION/main/pg_hba.conf"
PG_DIR="/var/lib/postgresql/$PG_VERSION/main"

# Edit postgresql.conf to change listen address to '*':
sed -i "s/#listen_addresses = 'localhost'/listen_addresses = '*'/" "$PG_CONF"

# Append to pg_hba.conf to add password auth:
echo "host    all             all             all                     md5" >> "$PG_HBA"

# Restart so that all new config is loaded:
service postgresql restart

cat << EOF | su - postgres -c psql
-- Create the database user:
CREATE USER $APP_DB_USER WITH PASSWORD '$APP_DB_PASS';

-- Create the databases:
CREATE DATABASE $APP_DB_NAME WITH OWNER $APP_DB_USER;
CREATE DATABASE $APP_DB_NAME_DEV WITH OWNER $APP_DB_USER;
CREATE DATABASE $APP_DB_NAME_TEST WITH OWNER $APP_DB_USER;
EOF

# Tag the provision time:
date > "$PROVISIONED_ON"

echo "Successfully created PostgreSQL dev virtual machine."
echo ""
print_db_usage

# update bash file to include project specific settings
if [ ! -f /var/log/bashsetup ];
then
	BASH_FILE="~/.bashrc"
	BASH_UPDATES="/vagrant/vagrantconfig/bashrc.sh"
	su - vagrant -c "cat $BASH_UPDATES >> $BASH_FILE"
	touch /var/log/bashsetup
fi

# install ruby-dev package, node.js
apt-get -y install ruby1.9.1-dev nodejs

# install rails as vagrant user 
su - vagrant -c "gem install rails -v 4.1.6 --no-rdoc --no-ri"

# system cleanup
apt-get -y autoremove