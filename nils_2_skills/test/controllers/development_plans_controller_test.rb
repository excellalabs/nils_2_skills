require 'test_helper'

class DevelopmentPlansControllerTest < ActionController::TestCase
  setup do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    @development_plan = development_plans(:one)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get show' do
    get :show, id: @development_plan
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @development_plan
    assert_response :success
  end

  test 'should create development_plan' do
    assert_difference('DevelopmentPlan.count') do
      post :create, development_plan: { plan_name: @development_plan.plan_name,
                                        description: @development_plan.description
                                      }
    end

    assert_redirected_to :Dashboard
  end

  test 'should update development_plan' do
    patch :update, id: @development_plan, development_plan: { plan_name: @development_plan.plan_name,
                                                              description: @development_plan.description
                                                            }

    assert_redirected_to development_plan_path(assigns(:development_plan))
  end

  test 'should destroy development_plan' do
    assert_difference('DevelopmentPlan.count', -1) do
      delete :destroy, id: @development_plan
    end

    assert_redirected_to :Dashboard
  end
end
