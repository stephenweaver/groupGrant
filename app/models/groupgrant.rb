class Groupgrant < ActiveRecord::Base
   belongs_to :charity,  			:foreign_key => "owner_id"
   belongs_to :business, 			:foreign_key => "partner_id"
   belongs_to :groupgrant_category, :foreign_key => "category_id"
    has_attached_file :groupgrant_pic, :styles => { :medium => "300x300>",:small => "200x200>", :thumb => "100x100>"}, :default_url => "/assets/:style/missing.jpg"
    validates :name, :category_id, :goal_amount, :goal_date, presence: true
   def self.search(search)
     if search
       temp1 = Groupgrant.all(:conditions => ['name LIKE ?', "%#{search}%"])
       temp2 = Groupgrant.all(:conditions => ['description LIKE ?', "%#{search}%"])
       (temp1 + temp2).uniq 
     else
       find(:all)
     end
   end

   def progress
      if self.goal_status.nil? || self.goal_amount.nil?
        return 0
      else
        self.goal_status / self.goal_amount * 100
      end
   end

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