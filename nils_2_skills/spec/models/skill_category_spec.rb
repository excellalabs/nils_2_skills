RSpec.describe SkillCategory do
  describe 'Model Associations' do
    it 'should have and belong to many skills' do
      should have_and_belong_to_many(:skills)
    end
  end

  describe 'Database Validation' do
    it 'should validate presence of category_name' do
      validate_presence_of(:category_name)
    end

    it 'should validate uniqueness of category_name' do
      validate_uniqueness_of(:category_name)
    end

    it 'should save with valid category_name' do
      skill_category = SkillCategory.new(category_name: 'TestCategoryName',
                                         description: 'TestDescription')
      expect(skill_category.save).to be true
    end
  end
end
