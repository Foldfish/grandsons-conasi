json.array!(@chains) do |chain|
  json.extract! chain, :id, :name
  json.url chain_url(chain, format: :json)
end
