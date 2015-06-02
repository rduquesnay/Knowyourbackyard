json.array!(@revisiondisputes) do |revisiondispute|
  json.extract! revisiondispute, :id, :comment, :revisionreview_id
  json.url revisiondispute_url(revisiondispute, format: :json)
end
