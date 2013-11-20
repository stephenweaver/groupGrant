class FixGoalStatus < ActiveRecord::Migration
  def change
  	rename_column :groupgrants, :goalstatus, :goal_status
  end
end
