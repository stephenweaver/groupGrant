class BusinessCategory < ActiveRecord::Base
   has_many :businesses, foreign_key: :category_id
end
