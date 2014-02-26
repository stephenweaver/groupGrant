class RemoveMessageIdFromRequests < ActiveRecord::Migration
  def change
  	remove_column :requests, :message_id
  end
end
