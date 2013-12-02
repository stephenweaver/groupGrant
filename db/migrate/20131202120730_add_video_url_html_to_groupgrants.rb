class AddVideoUrlHtmlToGroupgrants < ActiveRecord::Migration
   def change
      add_column :groupgrants, :video_url_html, :string
   end
end
