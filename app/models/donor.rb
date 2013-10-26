class Donor < ActiveRecord::Base
   has_one :user, :as => :rolable
end
