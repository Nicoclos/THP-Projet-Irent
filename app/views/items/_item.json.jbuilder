json.extract! item, :id, :title, :description, :price, :location, :img_url, :created_at, :updated_at
json.url item_url(item, format: :json)
