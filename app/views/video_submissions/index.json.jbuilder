json.array!(@video_submissions) do |video_submission|
  json.extract! video_submission, :id, :trail_id, :demo_link, :about
  json.url video_submission_url(video_submission, format: :json)
end
