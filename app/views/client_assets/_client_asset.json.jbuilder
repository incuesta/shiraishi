json.extract! client_asset, :id, :image, :name, :description, :created_at, :updated_at
json.url client_asset_url(client_asset, format: :json)
