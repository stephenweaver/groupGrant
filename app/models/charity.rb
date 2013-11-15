class Charity < ActiveRecord::Base
   belongs_to :charity_category, :foreign_key => "category_id"
   has_one :user, :as => :rolable
   has_many :groupgrants, :foreign_key => :owner_id
   validates :eid, :name, :presence => true

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

   def self.search(search)
     if search
       temp1 = Charity.all(:conditions => ['name LIKE ?', "%#{search}%"])
       temp2 = Charity.all(:conditions => ['description LIKE ?', "%#{search}%"])
       (temp1 + temp2).uniq 
     else
       find(:all)
     end
   end

end
