class AddVideoToCharities < ActiveRecord::Migration
  def change
    add_column :charities, :video_url, :string
    add_column :charities, :video_url_html, :string
  end
end
