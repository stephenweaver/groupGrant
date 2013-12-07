class Donor < ActiveRecord::Base
   has_one :user, :as => :rolable
   validates :first_name, :last_name, presence: {is: true, message: "Required"}
   # def koffi
   # 	if :first_name != ""
   # 	  if :first_name != "koffi"
   # 	  	errors.add(:first_name,	"not Koffi")
   # 	  end
   # 	end
   # end
end
