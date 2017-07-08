json.array!(@posts) do |post|
  json.extract! post, :id, :titile, :user_id, :restaurant_id, :content, :time_zone, :amount, :total_eval, :quality_eval, :service_eval, :atomos_eval, :drink_eval, :partner_eval, :visit_date, :url
  json.url post_url(post, format: :json)
end
