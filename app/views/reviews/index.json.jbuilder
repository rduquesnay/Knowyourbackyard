json.array!(@reviews) do |review|
  json.extract! review, :id, :name_review, :location_review, :rating_difficulty_review, :rating_duration_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :finalcomments, :trail_id, :posted_by
  json.url review_url(review, format: :json)
end
