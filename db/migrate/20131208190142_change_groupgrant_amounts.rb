class ChangeGroupgrantAmounts < ActiveRecord::Migration
  def change
   change_column :groupgrants, :goal_amount, :decimal, :precision => 10, :scale => 2
   change_column :groupgrants, :goal_status, :decimal, :precision => 10, :scale => 2
  end
end
