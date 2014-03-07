class AddLastPingTimeToUsers < ActiveRecord::Migration
  def change
      add_column :users, :last_ping_time, :datetime
  end
end
