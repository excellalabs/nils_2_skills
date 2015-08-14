require 'date'

# Destroy all previous seeds
# Wipe the DB before seeding to eliminate errors for unique fields
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

# Ruby
ruby = SkillCategory.create!(category_name: "Ruby", description: "Ruby stack")
Skill.create!(skill_name: "Ruby", category: ruby)
Skill.create!(skill_name: "Ruby on Rails", category: ruby)

# .NET
net = SkillCategory.create!(category_name: ".NET", description: ".NET & Microsoft stack")
Skill.create!(skill_name: "C#", category: net)
Skill.create!(skill_name: "ASP.NET", category: net)

# Java
java = SkillCategory.create!(category_name: "Java", description: "Java stack")
Skill.create!(skill_name: "Java", category: java)

# Python
python = SkillCategory.create!(category_name: "Python", description: "Python stack")
Skill.create!(skill_name: "Python", category: python)
Skill.create!(skill_name: "Django", category: python)

# Javascript
js = SkillCategory.create!(category_name: "Javascript", description: "Javascript stack")
Skill.create!(skill_name: "Javascript", category: js)
Skill.create!(skill_name: "Node.js", category: js)