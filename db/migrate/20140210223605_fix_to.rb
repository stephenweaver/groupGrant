class FixTo < ActiveRecord::Migration
  def change
  	rename_column :messages, :to, :to_user
  	rename_column :messages, :from, :from_user
  end
end