json.array!(@image_pairs) do |image_pair|
  json.extract! image_pair, :id, :votes_first, :votes_second, :user_id
  json.url image_pair_url(image_pair, format: :json)
end
