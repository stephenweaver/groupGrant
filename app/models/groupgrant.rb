class Groupgrant < ActiveRecord::Base
   belongs_to :charity,  			:foreign_key => "owner_id"
   belongs_to :business, 			:foreign_key => "partner_id"
   belongs_to :groupgrant_category, :foreign_key => "category_id"

   def self.search(search)
     if search
       temp1 = Groupgrant.all(:conditions => ['name LIKE ?', "%#{search}%"])
       temp2 = Groupgrant.all(:conditions => ['description LIKE ?', "%#{search}%"])
       (temp1 + temp2).uniq 
     else
       find(:all)
     end
   end

end


