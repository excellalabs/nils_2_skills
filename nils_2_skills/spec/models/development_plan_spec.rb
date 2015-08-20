require 'rails_helper'

RSpec.describe DevelopmentPlan do
  describe 'Model Associations' do
    it 'should have many development skills' do
      should have_many(:development_skills)
    end
    it 'should belong to user' do
      should belong_to(:user)
    end
  end

  describe 'Database Validation' do
    it 'should validate presence of plan name' do
      validate_presence_of(:plan_name)
    end
    it 'should validate presence of description' do
      validate_presence_of(:description)
    end
  end

  it 'requires name' do
    expect(DevelopmentPlan.new(description: 'Test')).to_not be_valid
  end

  it 'requires description' do
    expect(DevelopmentPlan.new(plan_name: 'Test')).to_not be_valid
  end

  it 'validates name length' do
    expect(DevelopmentPlan.new(plan_name: ('a' * 52))).to_not be_valid
  end

  it { validate_presence_of(:plan_name) }
end
