class AddGoalstatusToGroupgrants < ActiveRecord::Migration
  def change
  	add_column :groupgrants, :goalstatus, :decimal
  end
end