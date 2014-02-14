class FixToAgain < ActiveRecord::Migration
  def change
  	rename_column :messages, :to_user, :user_received_id
  	rename_column :messages, :from_user, :user_sent_id
  end
end
