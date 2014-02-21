class RemoveDates < ActiveRecord::Migration
  def change
  	remove_column :requests, :date
	remove_column :messages, :date
  end
end
