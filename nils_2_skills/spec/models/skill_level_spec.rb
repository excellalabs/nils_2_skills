require 'rails_helper'

RSpec.describe SkillLevel do
  describe 'Database Validation' do
    it 'should validate presence of level' do
      validate_presence_of(:level)
    end
  end
  describe 'Model Associations' do
    it 'should have many development skill levels' do
      should have_many(:development_skill_levels)
    end

    it 'should have many development skills through development skill levels' do
      should have_many(:development_skills).through(:development_skill_levels)
    end
  end

  it 'requires level' do
    expect(SkillLevel.new(level: nil)).to_not be_valid
  end

  it 'does not require description' do
    expect(SkillLevel.new(level: 'Test', description: nil)).to be_valid
  end

  it 'requires unique level' do
    SkillLevel.create(level: 'Test', description: 'Test')
    expect(SkillLevel.new(level: 'Test', description: 'Test')).to_not be_valid
  end
end
