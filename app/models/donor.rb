class Donor < ActiveRecord::Base
   has_one :user, :as => :rolable
   validates :first_name, :last_name, presence: {is: true, message: "Required"}
 
end
