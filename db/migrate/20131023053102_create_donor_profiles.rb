class CreateDonorProfiles < ActiveRecord::Migration
  def change
    create_table :donor_profiles do |t|

      t.timestamps
    end
  end
end
