json.array!(@sponsors) do |sponsor|
  json.extract! sponsor, :id, :companyname, :about, :link
  json.url sponsor_url(sponsor, format: :json)
end
