class AddAttachmentGroupgrantPicToGroupgrants < ActiveRecord::Migration
  def self.up
    change_table :groupgrants do |t|
      t.attachment :groupgrant_pic
    end
  end

  def self.down
    drop_attached_file :groupgrants, :groupgrant_pic
  end
end
