json.array!(@images) do |image|
  json.extract! image, :id, :avatar, :image_pair_id
  json.url image_url(image, format: :json)
end
