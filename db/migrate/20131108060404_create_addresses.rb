class CreateAddresses < ActiveRecord::Migration
  def change
    create_table :addresses do |t|
      t.integer :user_id
      t.string :full_name
      t.string :line_one
      t.string :line_two
      t.string :city
      t.string :state
      t.string :zip
      t.string :country
      t.string :phone
      t.string :address_type
      t.string :access_code

      t.timestamps
    end
  end
end
