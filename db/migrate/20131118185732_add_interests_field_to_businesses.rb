class AddInterestsFieldToBusinesses < ActiveRecord::Migration
  def change
    add_column :businesses, :interests, :string
  end
end
