class AddFieldsToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :category, :string
  end
end
