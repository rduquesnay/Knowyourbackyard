json.array!(@resolvedrevisiondisputes) do |resolvedrevisiondispute|
  json.extract! resolvedrevisiondispute, :id, :trail_id, :revision_id, :revisied_name, :revisied_location, :revisied_season, :revisied_trailtype, :revisied_latitude, :revisied_longitude, :revisied_traildirections, :review_id, :name_review, :location_review, :length_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :finalcomments, :review_user_id, :dispute_comment, :dispute_action, :comment
  json.url resolvedrevisiondispute_url(resolvedrevisiondispute, format: :json)
end
