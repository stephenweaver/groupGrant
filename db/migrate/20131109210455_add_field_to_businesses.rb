class AddFieldToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :phone_number, :integer
  end
end
