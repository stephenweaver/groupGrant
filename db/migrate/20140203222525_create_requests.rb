class CreateRequests < ActiveRecord::Migration
  def change
    create_table :requests do |t|
      t.boolean :is_accepted
      t.boolean :is_rejected
      t.date :date
      t.date :date_responded

      t.timestamps
    end
  end
end
