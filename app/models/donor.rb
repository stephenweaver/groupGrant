class Donor < ActiveRecord::Base
   #validates :title, :first_name, :last_name, presense: true
   has_one :user, :as => :rolable
   validates :first_name, :last_name, :presence => true
   accepts_nested_attributes_for :user
end
