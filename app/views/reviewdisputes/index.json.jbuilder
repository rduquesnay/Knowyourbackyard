json.array!(@reviewdisputes) do |reviewdispute|
  json.extract! reviewdispute, :id, :comment, :review_id
  json.url reviewdispute_url(reviewdispute, format: :json)
end
