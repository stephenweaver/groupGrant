class Groupgrant < ActiveRecord::Base
   belongs_to :user, :foreign_key => "owner_id"
end
