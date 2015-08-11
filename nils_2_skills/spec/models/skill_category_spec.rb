require "rails_helper"

RSpec.describe SkillCategory do 
  
  it "should require category_name" do
  	expect(SkillCategory.new(:category_name => nil)).to_not be_valid
  end

  it "should not require description" do
  	expect(SkillCategory.new(:category_name => "Test", :description => nil)).to be_valid
  end

  it "should require unique category_name" do
    existing_category = SkillCategory.create(:category_name => "Test", :description => "Test")
    expect(SkillCategory.new(:category_name => "Test", :description => "Test")).to_not be_valid
  end
	
end