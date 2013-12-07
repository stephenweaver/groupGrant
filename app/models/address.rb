class Address < ActiveRecord::Base
   belongs_to :user
   #validates :line_two, :city, :zip, :country, :phone, presence: true
end
