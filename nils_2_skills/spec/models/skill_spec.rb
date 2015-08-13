require "rails_helper"

describe Skill do
	
	describe 'Field Tests' do
		it 'saves the skills name' do
			s = Skill.new
			s.skill_name = "Test Skill"
			expect(s.skill_name).to eq('Test Skill')
		end

		it 'saves the description' do
			s = Skill.new
			s.description = "Test Description"
			expect(s.description).to eq('Test Description')
		end

		it 'saves the category' do
			s = Skill.new
			s.category = "Test Category"
			expect(s.category).to eq('Test Category')
		end
	end

	describe 'db validation' do
		it 'must have a name and a category' do
			s = Skill.new
			s.category = "Test Category"
			s.skill_name = "Test Skill_Name"
			expect(s).to be_valid
		end

		it 'is not valid with only one of them' do
			s = Skill.new
			expect(s).to_not be_valid
		end
	end
end