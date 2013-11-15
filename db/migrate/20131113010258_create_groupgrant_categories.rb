class CreateGroupgrantCategories < ActiveRecord::Migration
  def change
    create_table :groupgrant_categories do |t|
      t.string :name

      t.timestamps
    end
  end
end
