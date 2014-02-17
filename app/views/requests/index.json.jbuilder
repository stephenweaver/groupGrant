json.array!(@requests) do |request|
  json.extract! request, :id, :is_accepted, :is_rejected, :date, :date_responded
  json.url request_url(request, format: :json)
end
