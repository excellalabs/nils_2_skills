class UserController < ApplicationController
  before_action :authenticate_user!

  def Dashboard
  end

  def Profile
  end
end
