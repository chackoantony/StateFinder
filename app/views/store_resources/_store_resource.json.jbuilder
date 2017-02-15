json.extract! store_resource, :id, :resource_type, :changed_at, :changed_values, :created_at, :updated_at
json.url store_resource_url(store_resource, format: :json)