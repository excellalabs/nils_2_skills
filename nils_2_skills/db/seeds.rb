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
Skill.destroy_all
SkillCategory.destroy_all
SkillLevel.destroy_all

user_list = [
	[ "Jon La Marr", "jon.lamarr@excella.com" ],
	[ "Brian Palladino", "brian.palladino@excella.com" ],
	[ "Allison Zentmayer", "allison.zentmayer@excella.com" ],
	[ "Kevin Ellis", "kevin.ellis@excella.com" ],
	[ "Frances Johnson", "frances.johnson@excella.com"],
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

# skill levels
SkillLevel.create!(level: "Beginner", description: "Beginner with no experience" )
SkillLevel.create!(level: "Junior", description: "Junior developer level" )
SkillLevel.create!(level: "Mid", description: "Mid developer level" )
SkillLevel.create!(level: "Senior", description: "Senior developer level" )

# skill array
skill_list = Array.new

# Ruby
ruby = SkillCategory.create!(category_name: "Ruby", description: "Ruby stack")
skill_list << Skill.new(skill_name: "Ruby").skill_categories << ruby
skill_list << Skill.new(skill_name: "Ruby on Rails").skill_categories << ruby

# .NET
net = SkillCategory.create!(category_name: ".NET", description: ".NET & Microsoft stack")
skill_list << Skill.new(skill_name: "C#").skill_categories << net
skill_list << Skill.new(skill_name: "ASP.NET").skill_categories << net

# Java
java = SkillCategory.create!(category_name: "Java", description: "Java stack")
skill_list << Skills.new(skill_name: "Java").skill_categories << java

# Python
python = SkillCategory.create!(category_name: "Python", description: "Python stack")
skill_list << Skill.new(skill_name: "Python").skill_categories << python
skill_list << Skill.new(skill_name: "Django").skill_categories << python

# Javascript
js = SkillCategory.create!(category_name: "Javascript", description: "Javascript stack")
skill_list << Skills.create!(skill_name: "Javascript").skill_categories << js
skill_list << Skills.create!(skill_name: "Node.js").skill_categories << js

# save skills to db
skill_list.each	do |s|
  s.save
end


