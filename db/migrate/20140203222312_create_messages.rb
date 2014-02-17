class CreateMessages < ActiveRecord::Migration
  def change
    create_table :messages do |t|
      t.integer :to
      t.integer :from
      t.boolean :read
      t.boolean :deleted
      t.date :date
      t.text :body

      t.timestamps
    end
  end
end
