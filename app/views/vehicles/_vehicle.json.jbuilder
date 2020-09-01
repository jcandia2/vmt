json.extract! vehicle, :id, :vin, :year, :make, :model, :miles, :color, :created_at, :updated_at
json.url vehicle_url(vehicle, format: :json)
