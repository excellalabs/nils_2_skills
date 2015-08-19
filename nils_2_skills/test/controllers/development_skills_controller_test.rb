require 'test_helper'

class DevelopmentSkillsControllerTest < ActionController::TestCase
  setup do
    @development_skill = development_skills(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:development_skills)
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should create development_skill' do
    assert_difference('DevelopmentSkill.count') do
      post :create, development_skill: {  completed: @development_skill.completed,
                                          current_skill_level: @development_skill.current_skill_level,
                                          desired_skill_level: @development_skill.desired_skill_level,
                                          notes: @development_skill.notes,
                                          percent_complete: @development_skill.percent_complete,
                                          skill_name: @development_skill.skill_name
                                        }
    end

    assert_redirected_to development_skill_path(assigns(:development_skill))
  end

  test 'should show development_skill' do
    get :show, id: @development_skill
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @development_skill
    assert_response :success
  end

  test 'should update development_skill' do
    patch :update, id: @development_skill, development_skill: { completed: @development_skill.completed,
                                                                current_skill_level: @development_skill.current_skill_level,
                                                                desired_skill_level: @development_skill.desired_skill_level,
                                                                notes: @development_skill.notes,
                                                                percent_complete: @development_skill.percent_complete,
                                                                skill_name: @development_skill.skill_name
          }
    assert_redirected_to development_skill_path(assigns(:development_skill))
  end

  test 'should destroy development_skill' do
    assert_difference('DevelopmentSkill.count', -1) do
      delete :destroy, id: @development_skill
    end

    assert_redirected_to development_skills_path
  end
end
