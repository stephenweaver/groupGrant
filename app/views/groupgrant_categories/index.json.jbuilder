json.array!(@groupgrant_categories) do |groupgrant_category|
  json.extract! groupgrant_category, :name
  json.url groupgrant_category_url(groupgrant_category, format: :json)
end
