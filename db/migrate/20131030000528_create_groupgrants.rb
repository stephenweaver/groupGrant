class CreateGroupgrants < ActiveRecord::Migration
  def change
    create_table :groupgrants do |t|
      t.string :name
      t.text :description
      t.date :goal_date
      t.decimal :goal_amount
      t.integer :owner_id
      t.integer :partner_id
      t.datetime :completed_date
      t.boolean :is_complete
      t.boolean :is_enabled
      t.string :video_url

      t.timestamps
    end
  end
end
