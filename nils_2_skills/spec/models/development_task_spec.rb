require 'rails_helper'

RSpec.describe DevelopmentTask do
  describe 'Model Associations' do
    it 'should belong to development skill' do
      should belong_to(:development_skill)
    end
  end

  describe 'Database Validation' do
    it 'should validate presence of task name' do
      validate_presence_of(:task_name)
    end
    it 'should validate presence of devplan id' do
      validate_presence_of(:development_skill_id)
    end
  end

  it 'requires task name' do
    expect(DevelopmentTask.new(details: 'Test')).to_not be_valid
  end

  it 'validates name length' do
    expect(DevelopmentTask.new(task_name: ('a' * 52))).to_not be_valid
  end

  it 'validates start date is before end date' do
    expect(DevelopmentTask.new(task_name: 'Test', start_date: Time.Zone.today, completion_date: '2015-01-01')).to_not be_valid
  end
end
