describe User do
  it "associates a development plan with a user" do
	user = User.create!(username: "Allison", email: "allison.zentmayer@excella.com", password: "password",
		created_at: Date.today, updated_at: Date.today, confirmed_at: Date.today)
	plan = DevelopmentPlan.new( :plan_name => "Plan1", :description => "Desc")
    user.development_plans << plan
    expect(user.development_plans.count).to eq(1)
  end
end