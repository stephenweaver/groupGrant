class Message < ActiveRecord::Base
	belongs_to :user,  foreign_key: :user_id
	has_one :request,  foreign_key: :request_id
	validates :body, :to, presence: {is: true, message: "Required"}
end