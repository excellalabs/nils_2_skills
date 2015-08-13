require "rails_helper"

RSpec.describe SkillLevelsController, :type => :controller do

describe "GET #index" do

  it "responds successfully" do
    get :index
    expect(response).to be_success
  end
  it "renders the index template" do
	get :index
	expect(response).to render_template("index")
  end
end

  describe "GET skill_levels#new" do
  	it "responds successfully" do
      get :new
      expect(response).to be_success
    end

  	it "renders the new template" do
      get :new
      expect(response).to render_template("new")
    end
  end

end