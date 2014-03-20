class Business < ActiveRecord::Base
   belongs_to :business_category, :foreign_key => "category_id"
   has_one :user, :as => :rolable
   has_many :groupgrants, :foreign_key => :owner_id
   has_attached_file :business_pic, :styles => { :medium => "300x300>", 
      :small => "200x200>", :thumb => "100x100>"}, :default_url => "medium/business_default.png"
   validates :name, :category_id, presence: {is: true, message: "Required"}
  validates_uniqueness_of :name, message: "This business name is alread taken"

   def self.search(search)
     if search
       temp1 = Business.all(:conditions => ['name LIKE ?', "%#{search}%"])
       temp2 = Business.all(:conditions => ['description LIKE ?', "%#{search}%"])
       temp3 = Business.all(:conditions => ['interests LIKE ?', "%#{search}%"])
       (temp1 + temp2 + temp3).uniq 
     else
       find(:all)
     end
   end
end