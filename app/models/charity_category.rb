class CharityCategory < ActiveRecord::Base
   has_many :charities, foreign_key: :category_id
end
