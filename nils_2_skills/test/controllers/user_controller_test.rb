require 'test_helper'

class UserControllerTest < ActionController::TestCase
  def setup
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  end

  test 'should get Dashboard' do
    get :Dashboard
    assert_response :success
  end

  test 'should get Profile' do
    get :Profile
    assert_response :success
  end
end
