json.array!(@advertisers) do |advertiser|
  json.extract! advertiser, :id, :name, :email, :phone, :message
  json.url advertiser_url(advertiser, format: :json)
end
