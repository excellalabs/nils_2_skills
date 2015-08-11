require "rails_helper"

describe DevelopmentPlan do

  it "should require name" do
    expect(DevelopmentPlan.new(:description => "Test")).to_not be_valid
  end

  it "should require description" do
    expect(DevelopmentPlan.new(:plan_name => "Test")).to_not be_valid
  end

  it "should validate name length" do
    expect(DevelopmentPlan.new(:plan_name => ("a"*52))).to_not be_valid
  end

end