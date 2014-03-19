class AddFieldToUser < ActiveRecord::Migration
  def change
    add_column :users, :allocated_amount, :integer
  end
end
