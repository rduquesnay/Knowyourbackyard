json.array!(@revisiondiputes) do |revisiondipute|
  json.extract! revisiondipute, :id, :comment, :revisionreview_id
  json.url revisiondipute_url(revisiondipute, format: :json)
end
