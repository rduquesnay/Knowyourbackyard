json.array!(@images) do |image|
  json.extract! image, :id, :url, :trail_id
  json.url image_url(image, format: :json)
end
