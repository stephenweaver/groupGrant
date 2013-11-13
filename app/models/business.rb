class Business < ActiveRecord::Base
   has_one  :user, 		  :as 		   => :rolable
   has_many :groupgrants, :foreign_key => :partner_id
end
