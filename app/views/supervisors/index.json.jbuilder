json.array!(@supervisors) do |supervisor|
  json.extract! supervisor, :id, :name, :phone, :RFC, :store_id
  json.url supervisor_url(supervisor, format: :json)
end
