class Charity < ActiveRecord::Base
   belongs_to :charity_category, :foreign_key => "category_id"
   has_one :user, :as => :rolable
   has_many :groupgrants, :foreign_key => :owner_id
   validates :eid, :name, :category_id, presence: {is: true, message: "Required"}
   validates :name, format: {with: /[a-z]/i, message: "Only letters allowed"}
   validates :eid, length: {minimum:8, maximum: 9, message: "Invalid length"}
   #validate my_ein

   # def my_ein
   #    #if :eid
   #      :eid = "hi"
   #    #end
   #     # current = :eid.to_s.split('').map { |digit| digit.to_i}
   #    # :eid = :eid.to_s.split('').map { |digit| digit.to_i}
   #    # num = :eid.to_s
   #    # case :eid[0]
   #    #   when 0..1
   #    #     if eid[1] != 7..9
   #    #       errors.add(:eid, num)
   #    #     end
   #      # when 2
   #      # when 4
   #      # when 6
   #      # when 7
   #      # when 8
   #      # else
   #      #   errors.add(:eid, "Invalid EIN")
   #    #end
   # end



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
