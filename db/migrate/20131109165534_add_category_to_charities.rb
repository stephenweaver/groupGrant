class AddCategoryToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :category_id, :integer
  end
end
