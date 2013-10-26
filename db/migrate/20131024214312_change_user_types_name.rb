class ChangeUserTypesName < ActiveRecord::Migration
    def change
        rename_column :users, :profile_id, :rolable_id
        rename_column :users, :profile_type, :rolable_type
    end 
 end