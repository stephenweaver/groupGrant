class Request < ActiveRecord::Base
	belongs_to :message, foreign_key: :message_id
	has_one :user, :as => :rolable
end
