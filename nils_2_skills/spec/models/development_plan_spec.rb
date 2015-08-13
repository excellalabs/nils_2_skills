require "rails_helper"

describe DevelopmentPlan do

  it "requires name" do
    expect(DevelopmentPlan.new(:description => "Test")).to_not be_valid
  end

  it "requires description" do
    expect(DevelopmentPlan.new(:plan_name => "Test")).to_not be_valid
  end

  it "validates name length" do
    expect(DevelopmentPlan.new(:plan_name => ("a"*52))).to_not be_valid
  end

end