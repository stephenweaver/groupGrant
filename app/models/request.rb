class Request < ActiveRecord::Base
	belongs_to :message, foreign_key: :message_id, dependent: :destroy
	has_one :groupgrant,  foreign_key: :groupgrant_id
	has_one :user, :as => :rolable
end
