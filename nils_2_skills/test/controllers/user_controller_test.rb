require 'test_helper'

class UserControllerTest < ActionController::TestCase
  test "should get Login" do
    get :Login
    assert_response :success
  end

  test "should get Signup" do
    get :Signup
    assert_response :success
  end

  test "should get Dashboard" do
    get :Dashboard
    assert_response :success
  end

  test "should get Profile" do
    get :Profile
    assert_response :success
  end

end
