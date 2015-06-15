json.array!(@videomaker_submissions) do |videomaker_submission|
  json.extract! videomaker_submission, :id, :user_id, :demo_link, :about
  json.url videomaker_submission_url(videomaker_submission, format: :json)
end
