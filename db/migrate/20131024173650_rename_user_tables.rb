class RenameUserTables < ActiveRecord::Migration
    def change
        rename_table :business_profiles, :businesses
        rename_table :donor_profiles, :donors
        rename_table :charity_profiles, :charities
    end 
 end