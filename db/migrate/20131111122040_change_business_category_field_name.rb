class ChangeBusinessCategoryFieldName < ActiveRecord::Migration
  def change
	change_table :businesses do |t|
	  t.rename :category, :category_id
	end
  end
end