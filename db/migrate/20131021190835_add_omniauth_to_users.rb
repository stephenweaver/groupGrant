class AddOmniauthToUsers < ActiveRecord::Migration
   def change
      add_column :users, :provider, :string
      add_column :users, :uid, :string
      add_column :users, :fb_token_expires_at_token, :string
      add_column :users, :fb_token_expires_at, :string
  end
end
