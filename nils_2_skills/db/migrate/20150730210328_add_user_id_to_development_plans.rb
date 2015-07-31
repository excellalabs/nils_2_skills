class AddUserIdToDevelopmentPlans < ActiveRecord::Migration
  def change
  	change_table(:development_plans) do |t|
  		t.integer :user_id
  	end
  end
end
