class Donor < ActiveRecord::Base
   #validates :title, :first_name, :last_name, presense: true
   has_one :user, :as => :rolable

end
