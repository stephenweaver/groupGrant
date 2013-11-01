json.array!(@groupgrants) do |groupgrant|
  json.extract! groupgrant, :name, :description, :goal_date, :goal_amount, :owner_id, :partner_id, :completed_date, :is_complete, :is_enabled, :video_url
  json.url groupgrant_url(groupgrant, format: :json)
end
