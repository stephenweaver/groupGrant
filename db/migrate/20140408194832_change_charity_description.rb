class ChangeCharityDescription < ActiveRecord::Migration
  def change
  	change_column :charities, :description, :text
  end
end
