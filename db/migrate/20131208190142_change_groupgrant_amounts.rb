class ChangeGroupgrantAmounts < ActiveRecord::Migration
  def change
  	change_column :groupgrants, :goal_amount, :decimal
  	change_column :groupgrants, :goal_status, :decimal  	
  end
end
