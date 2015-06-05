json.array!(@resolvedreviewdisputes) do |resolvedreviewdispute|
  json.extract! resolvedreviewdispute, :id, :trail_id, :review_id, :name_review, :location_review, :rating_difficulty_review, :rating_duration_review, :season_review, :trailtype_review, :length_review, :gps_review, :traildirections_review, :finalcomments, :review_user_id, :dispute_comment, :dispute_action, :comment
  json.url resolvedreviewdispute_url(resolvedreviewdispute, format: :json)
end
