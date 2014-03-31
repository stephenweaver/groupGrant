class Groupgrant < ActiveRecord::Base
   belongs_to :charity,  			:foreign_key => "owner_id"
   belongs_to :business, 			:foreign_key => "partner_id"
   belongs_to :groupgrant_category, :foreign_key => "category_id"
   has_attached_file :groupgrant_pic, :styles => { :medium => "300x300>", 
      :small => "200x200>", :thumb => "100x100>"}, :default_url => "medium/missing.png"
   validates :name, :category_id, :goal_amount, :goal_date, presence: 
      {is: true, message: "Required"}
   validates :name, length: {in: 3..30, too_short: "Try using a meaningful name",
    too_long: "%{count} characters is the maximum allowed"},
              uniqueness: {is: true, message: "%{value}  has already been taken"}
   validates :goal_amount, numericality: {is: true, message: "Please enter only numbers"}
   validates :goal_amount, numericality: {greater_than: 99, 
    less_than_or_equal_to: 100000, message: "The amount must be between $100 and $100,000"}
  validate :date


  def date
    if goal_date.present? && goal_date < Date.today
      errors.add(:goal_date, "Please choose a future date")
    end
  end


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
    begin
      if self.goal_status.nil? || self.goal_amount.nil?
        return 0
      else
        self.goal_status.to_f / self.goal_amount.to_f * 100.0
      end
rescue => error
  Rails.logger.info("computeed error")
  Rails.logger.info(error.message)
end
   end

   def days_left
      (self.goal_date - Time.now).to_i
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