class Message < ActiveRecord::Base
	belongs_to :user,  foreign_key: :user_received_id
	belongs_to :user, foreign_key: :user_sent_id
	has_one :request,  foreign_key: :request_id
	validates :body, presence: {is: true, message: "Required"}
end