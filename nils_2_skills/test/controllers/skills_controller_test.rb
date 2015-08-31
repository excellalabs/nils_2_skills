require 'test_helper'

class SkillsControllerTest < ActionController::TestCase
  setup do
    @request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin) # Using factory girl as an example
    @skill = skills(:skill_one)
  end

  test 'should get index' do
    get :index
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @skill
    assert_response :success
  end

  test 'should show skill' do
    get :show, id: @skill
    assert_response :success
  end

  test 'should create skill' do
    assert_difference('Skill.count') do
      post :create, skill:
      {
        skill_name: @skill.skill_name,
        category: @skill.category,
        description: @skill.description
      }
    end

    assert_redirected_to skills_path
  end

  test 'should update skill' do
    patch :update, id: @skill, skill:
    {
      skill_name: @skill.skill_name,
      category: @skill.category,
      description: @skill.description
    }

    assert_redirected_to skills_path
  end

  test 'should destroy skill' do
    assert_difference('Skill.count', -1) do
      delete :destroy, id: @skill
    end

    assert_redirected_to skills_path
  end
end
