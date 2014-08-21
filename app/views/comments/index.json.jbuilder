json.array!(@comments) do |comment|
  json.extract! comment, :id, :podpis, :komentarz, :post_id
  json.url comment_url(comment, format: :json)
end
