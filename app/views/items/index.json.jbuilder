json.array!(@items) do |item|
  json.extract! item, :raiting, :price, :name, :description
  json.url item_url(item, format: :json)
end
