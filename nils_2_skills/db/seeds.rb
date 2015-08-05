# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Wipe the DB before seeding to eliminate errors for unique fields
require 'date'

# Destroy all previous seeds
User.destroy_all
DevelopmentPlan.destroy_all

user_list = [
	[ "Jon La Marr", "jon.lamarr@excella.com" ],
	[ "Brian Palladino", "brian.palladino@excella.com" ],
	[ "Allison Zentmayer", "allison.zentmayer@excella.com" ],
	[ "Kevin Ellis", "kevin.ellis@excella.com" ],
	[ "fake_user", "fake.user@fakeemail.com" ]
]

# '!' will throw an exception if the creation does not occur
today = Date.today.to_s
user_list.each do |name, email|
	user = User.create!(username: name, email: email, password: "password",
		created_at: today, updated_at: today, confirmed_at: today)

	rand(10).times do |i|
		user.development_plans.create!(plan_name: "Plan #{i+1} for #{user.username}", 
								  	   description: "This is a development plan.")
	end
end