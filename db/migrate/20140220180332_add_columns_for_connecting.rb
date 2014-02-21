class AddColumnsForConnecting < ActiveRecord::Migration
  def change
  	add_column :messages, :request_id, :integer
	add_column :requests, :groupgrant_id, :integer
	add_column :requests, :message_id, :integer
  end
end
