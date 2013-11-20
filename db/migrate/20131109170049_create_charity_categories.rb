class CreateCharityCategories < ActiveRecord::Migration
  def change
    create_table :charity_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
