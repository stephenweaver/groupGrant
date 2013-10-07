class AddFbDetailsToUsers < ActiveRecord::Migration
  def change
    add_column :users, :fb_user, :string
    add_column :users, :fb_model, :string
    add_column :users, :fb_provider, :string
    add_column :users, :fb_uid, :string
    add_column :users, :fb_name, :string
    add_column :users, :fb_oath_token, :string
    add_column :users, :fb_oauth_expires_at, :datetime
  end
end   