json.array!(@addresses) do |address|
  json.extract! address, :user_id, :full_name, :line_one, :line_two, :city, :state, :zip, :country, :phone, :address_type, :access_code
  json.url address_url(address, format: :json)
end
