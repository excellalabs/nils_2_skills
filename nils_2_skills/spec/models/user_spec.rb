describe User do
  it "associates a development plan with a user" do
	user = User.create!(username: "Allison", email: "allison.zentmayer@excella.com", password: "password",
		confirmed_at: Date.today)
	plan = DevelopmentPlan.new( :plan_name => "Plan1", :description => "Desc")
    user.development_plans << plan
    expect(user.development_plans.count).to eq(1)
  end

  it "returns a list of completed development skills for the user" do
  	user = User.create!(username: "Test", email: "test@excella.com", password: "password", 
  		    confirmed_at: Date.today)
  	category = SkillCategory.create(category_name: "Test Category")
  	skill = Skill.create!(skill_name: "Test Skill", category: category)
    devskill = DevelopmentSkill.create!(user: user, skill: skill, completed: true)
  	expect(user.my_skills.count).to eq(1)
  end

end