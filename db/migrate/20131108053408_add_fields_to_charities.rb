class AddFieldsToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :mission_statement, :string
    add_column :charities, :cover_photo, :string
    add_column :charities, :target_area, :string
  end
end
