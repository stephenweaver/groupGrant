json.array!(@messages) do |message|
  json.extract! message, :id, :to, :from, :read, :deleted, :date, :body
  json.url message_url(message, format: :json)
end
