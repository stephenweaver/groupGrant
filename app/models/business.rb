class Business < ActiveRecord::Base
   has_one :user, :as => :rolable
end
