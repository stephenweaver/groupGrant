class ChangeEidType < ActiveRecord::Migration
  def change
  	change_column :charities, :eid, :integer
  end
end
