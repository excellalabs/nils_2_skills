require 'rails_helper'

RSpec.describe DevelopmentSkill do
  describe 'Model Associations' do
    it 'should have many development tasks' do
      should have_many(:development_tasks)
    end
    it 'should belong to user' do
      should belong_to(:user)
    end
    it 'should belong to skill' do
      should belong_to(:skill)
    end
    # it 'should have and belong to many development plans' do
    # 	should have_and_belong_to_many(:development_plans)
    # end
  end
end
