RSpec.describe Skill do
  describe 'Model Associations' do
    it 'should have many development skills' do
      should have_many(:development_skills)
    end

    it 'should have and belong to many skill categories' do
      should have_and_belong_to_many(:skill_categories)
    end
  end

  describe 'Database Validation' do
    it 'should validate presence of skill_name' do
      validate_presence_of(:skill_name)
    end

    it 'should validate presence of category' do
      validate_presence_of(:category)
    end

    it 'should save with valid skill_name and category' do
      skill = Skill.new(skill_name: 'TestName', category: 'TestCategory')
      expect(skill.save).to be true
    end
  end
end
