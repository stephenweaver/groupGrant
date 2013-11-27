class Donor < ActiveRecord::Base
   validates :title, :first_name, :last_name, presense: true
   has_one :user, :as => :rolable
   validates :first_name, :last_name, presence: true
   accepts_nested_attributes_for :user

   # def koffi
   # 	if :first_name != ""
   # 	  if :first_name != "koffi"
   # 	  	errors.add(:first_name,	"not Koffi")
   # 	  end
   # 	end
   # end
end
