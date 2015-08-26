require 'test_helper'

class DevelopmentTasksControllerTest < ActionController::TestCase
  def setup
  	@request.env['devise.mapping'] = Devise.mappings[:admin]
    sign_in FactoryGirl.create(:admin) # Using factory girl as an example
  	@development_task = development_tasks(:one)
  end

  test 'should get index' do
    get :index
    assert_response :success
    assert_not_nil assigns(:development_tasks)
  end

  test 'should show development_task' do
    get :show, id: @development_task
    assert_response :success
  end

  test 'should get new' do
    get :new
    assert_response :success
  end

  test 'should get edit' do
    get :edit, id: @development_task
    assert_response :success
  end

  test 'should create development_task' do
  	byebug
    assert_difference('DevelopmentTask.count') do
      post :create, development_task: { task_name: @development_task.task_name,
       									details: @development_task.details,
       									start_date: @development_task.start_date,
       									completion_date: @development_task.completion_date,
       									completed: @development_task.completed,
       								  	development_skill_id: @development_task.development_skill_id
       								  }
    end

    assert_redirected_to development_task_path(assigns(:development_task))
  end
end
