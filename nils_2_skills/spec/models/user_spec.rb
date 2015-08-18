require "rails_helper"

RSpec.describe User do
	describe "Database Validation" do
		it "must contain an email" do
			user = User.new(:email => nil, :password => "password")
			expect(user.save).to be false
		end

		it "must contain a valid email" do
			user = User.new(:email => "invalidemailaddress", :password => "password")
			expect(user.save).to be false
		end

		it "must contain a password" do
			user = User.new(:email => "valid@email.com", :password => nil)
			expect(user.save).to be false
		end

		it "must contain a valid password" do
			user = User.new(:email => "valid@email.com", :password => "seven#s")
			expect(user.save).to be false
		end

		it "must save with valid email and password" do
			user = User.new(:email => "valid@email.com", :password => "ValidPassword22", 
				:confirmed_at => Date.today) # Adding pre-confirmation for simplicity
			expect(user.save).to be true
		end
	end

	it "associates a development plan with a user" do
		user = User.create!(username: "Allison", email: "allison.zentmayer@excella.com", password: "password",
			created_at: Date.today, updated_at: Date.today, confirmed_at: Date.today)
		plan = DevelopmentPlan.new( :plan_name => "Plan1", :description => "Desc")
	    user.development_plans << plan
	    expect(user.development_plans.count).to eq(1)
	end
end