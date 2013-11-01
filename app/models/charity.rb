class Charity < ActiveRecord::Base
   has_one :user, :as => :rolable
   has_many :groupgrants
end
