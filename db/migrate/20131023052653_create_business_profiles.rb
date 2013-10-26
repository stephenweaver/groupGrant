class CreateBusinessProfiles < ActiveRecord::Migration
  def change
    create_table :business_profiles do |t|
      t.string :name
      t.string :goods
      t.string :services
      t.string :description

      t.timestamps
    end
  end
end
