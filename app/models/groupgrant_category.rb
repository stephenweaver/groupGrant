class GroupgrantCategory < ActiveRecord::Base
 	has_many :groupgrants, foreign_key: :category_id
end
