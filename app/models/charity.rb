class Charity < ActiveRecord::Base
   has_one :user, :as => :rolable
end