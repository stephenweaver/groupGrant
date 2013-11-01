class AddAttachmentProfileToUsers < ActiveRecord::Migration
  def self.up
    change_table :users do |t|
      t.attachment :profile
    end
  end

  def self.down
    drop_attached_file :users, :profile
  end
end
