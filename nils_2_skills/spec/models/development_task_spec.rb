require "rails_helper"

RSpec.describe DevelopmentTask do

  it "requires task name" do
    expect(DevelopmentTask.new(:details => "Test")).to_not be_valid
  end

  it "validates name length" do
    expect(DevelopmentTask.new(:task_name => ("a"*52))).to_not be_valid
  end
end