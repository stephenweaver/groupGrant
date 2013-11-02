class AddLocationToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :location, :string
  end
end
