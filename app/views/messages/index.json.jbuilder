json.array!(@messages) do |message|
  json.extract! message, :id, :user_received_id, :user_sent_id, :read, :deleted, :date, :body
  json.url message_url(message, format: :json)
end
