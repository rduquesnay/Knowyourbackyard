json.array!(@trails) do |trail|
  json.extract! trail, :id, :name, :location, :season, :trailtype, :latitude, :longitude, :traildirections
  json.url trail_url(trail, format: :json)
end
