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
end