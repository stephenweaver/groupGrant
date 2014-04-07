class Message < ActiveRecord::Base
	belongs_to :user,  foreign_key: :user_received_id
	belongs_to :user,  foreign_key: :user_sent_id
	has_one :request,  foreign_key: :request_id
	validates :body, presence: {is: true, message: "Required"}
    validates :user_received_id, :user_sent_id, presence: true
    profanity_filter :body, :method => 'dictionary'
    scope :all_requests, -> {where("request_id is not null")}
end