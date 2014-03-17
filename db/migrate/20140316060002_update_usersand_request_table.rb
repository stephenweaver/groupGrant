class UpdateUsersandRequestTable < ActiveRecord::Migration
  def change
  	add_column :users, :is_available, :integer
	remove_column :requests, :is_rejected
  end
end
