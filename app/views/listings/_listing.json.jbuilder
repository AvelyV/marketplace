json.extract! listing, :id, :user_id, :location_id, :title, :description, :price, :qty, :created_at, :updated_at
json.url listing_url(listing, format: :json)
