class CreateCharityProfiles < ActiveRecord::Migration
  def change
    create_table :charity_profiles do |t|
      t.string :name
      t.string :eid
      t.string :needs
      t.string :description

      t.timestamps
    end
  end
end
