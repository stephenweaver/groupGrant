class AddCategoryToGroupGrants < ActiveRecord::Migration
  def change
    add_column :groupgrants, :category_id, :integer
  end
end
