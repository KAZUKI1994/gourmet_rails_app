json.array!(@banners) do |banner|
  json.extract! banner, :id, :image, :link, :start_time, :finish_time
  json.url banner_url(banner, format: :json)
end
