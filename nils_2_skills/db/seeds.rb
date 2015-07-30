# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
user_list = [
	[ "Jon La Marr", "jon.lamarr@excella.com" ],
	[ "Brian Palladino", "brian.palladino@excella.com" ],
	[ "Allisoon Zentmayer", "allison.zentmayer@excella.com" ],
	[ "Kevin Ellis", "kevin.ellis@excella.com" ],
	[ "fake_user", "fake.user@fakeemail.com" ]
]

user_list.each do |name, email|
	# '!' will throw an exception if the creation does not occur
	User.create!(username: name, email: email, password: "password",
		created_at: "2015-07-30", updated_at: "2015-07-30", confirmed_at: '2015-07-30',
		encrypted_password: "$2a$10$1rIhyuOL8XPP6m6sn9dFwuodQrbybTKNLHz7HNB4bo.pkS9YQ2MAm")
end