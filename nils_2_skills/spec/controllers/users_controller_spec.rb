require "rails_helper"

RSpec.describe UserController, :type => :controller do
	login_admin

	describe "Logged in User" do
	  # User is logged in

	  it "should have a current_user" do
	    subject.current_user.should_not be_nil
	  end

	  it "should get Dashboard" do
	    get :Dashboard
	    response.should be_success
	  end
	end

	describe "Non logged in User" do
	  # User will be logged out
	  logout

	  it "should not have a current_user" do
		subject.current_user.should be_nil
	  end

	  it "should redirect to Sign In" do
		get :Dashboard
		response.should be_redirect
	  end
	end
  
end