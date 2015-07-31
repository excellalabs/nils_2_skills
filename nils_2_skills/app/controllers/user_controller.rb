class UserController < ApplicationController

before_action :authenticate_user!

  def Dashboard
  	byebug
  end

  def Profile
  end
end
