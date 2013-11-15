class Business < ActiveRecord::Base
   belongs_to :business_category, :foreign_key => "category_id"
   has_one :user, :as => :rolable
   has_many :groupgrants, :foreign_key => :owner_id

   def self.search(search)
     if search
       temp1 = Business.all(:conditions => ['name LIKE ?', "%#{search}%"])
       temp2 = Business.all(:conditions => ['description LIKE ?', "%#{search}%"])
       (temp1 + temp2).uniq 
     else
       find(:all)
     end
   end
end