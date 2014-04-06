class ChangeDescriptionFormatInCharities < ActiveRecord::Migration
  def change
    change_column :charities, :description, :text
  end

  def change
    change_column :businesses, :description, :text
  end
end
