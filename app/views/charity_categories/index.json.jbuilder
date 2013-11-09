json.array!(@charity_categories) do |charity_category|
  json.extract! charity_category, :name
  json.url charity_category_url(charity_category, format: :json)
end
