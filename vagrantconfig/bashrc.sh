# source rvm
source /home/vagrant/.rvm/scripts/rvm

# aliases
alias runserver="rails server -b 0.0.0.0"  # need to use -b param to bind ip add
alias accessdb="PGUSER=developer PGPASSWORD=developer psql -h localhost -p 5432 nils_2_skills_development"