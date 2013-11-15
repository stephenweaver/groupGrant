 class Business < ActiveRecord::Base
    belongs_to :business_category, :foreign_key => "category_id"
    has_one :user, :as => :rolable
    has_many :groupgrants, :foreign_key => :owner_id
 end