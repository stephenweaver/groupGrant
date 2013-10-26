class AddNameFieldsToUsers < ActiveRecord::Migration
   def change
      add_column :donors, :title, :string
      add_column :donors, :first_name, :string
      add_column :donors, :last_name, :string
      add_column :donors, :middle_initial, :string
   end
end
