describe DevelopmentTask do

  it "requires task name" do
    expect(DevelopmentTask.new(:details => "Test")).to_not be_valid
  end

  it "validates name length" do
    expect(DevelopmentTask.new(:task_name => ("a"*52))).to_not be_valid
  end

  it "validates start date is before end date" do
    expect(DevelopmentTask.new(:task_name => "Test", :start_date => Date.today, :completion_date => "2015-01-01")).to_not be_valid
  end
end