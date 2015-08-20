class UserController < ApplicationController
  before_action :authenticate_user!

  def dashboard
  end

  def profile
  end

  def my_skills
    @my_skills = current_user.my_skills
  end
end
