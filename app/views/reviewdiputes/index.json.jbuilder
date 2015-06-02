json.array!(@reviewdiputes) do |reviewdipute|
  json.extract! reviewdipute, :id, :comment, :review_id
  json.url reviewdipute_url(reviewdipute, format: :json)
end
