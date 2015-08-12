require "rails_helper"

RSpec.describe SkillLevel do 
  
  it "requires level" do
  	expect(SkillLevel.new(:level => nil)).to_not be_valid
  end

  it "does not require description" do
  	expect(SkillLevel.new(:level => "Test", :description => nil)).to be_valid
  end

  it "requires unique level" do
    existing_category = SkillLevel.create(:level => "Test", :description => "Test")
    expect(SkillLevel.new(:level => "Test", :description => "Test")).to_not be_valid
  end
	
end