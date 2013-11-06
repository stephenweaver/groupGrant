class Charity < ActiveRecord::Base
   has_one :user, :as => :rolable
   has_many :groupgrants, :foreign_key => :owner_id

   auto_html_for :video_url do
      html_escape
      image(:class => 'profile_video')
      youtube(:class => 'profile_video')
      dailymotion(:class => 'profile_video')
      vimeo(:class => 'profile_video')
      metacafe(:class => 'profile_video')
      soundcloud(:class => 'profile_video')
      twitter 
      google_map
      google_video
      flickr
      link :target => "_blank", :rel => "nofollow"
      simple_format
   end

end
