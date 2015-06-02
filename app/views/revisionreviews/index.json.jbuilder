json.array!(@revisionreviews) do |revisionreview|
  json.extract! revisionreview, :id, :name_review, :location_review, :season_review, :trailtype_review, :gps_review, :traildirection_review, :finalcomments, :user_id, :revision_id
  json.url revisionreview_url(revisionreview, format: :json)
end
