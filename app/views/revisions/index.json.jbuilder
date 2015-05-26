json.array!(@revisions) do |revision|
  json.extract! revision, :id, :name_review, :location_review, :season_review, :trailtype_review, :gps_review, :traildirections_review, :trail_id, :posted_by
  json.url revision_url(revision, format: :json)
end
