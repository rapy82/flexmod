json.array!(@configuration_keys) do |configuration_key|
  json.extract! configuration_key, :id, :key, :value, :description, :section
  json.url configuration_key_url(configuration_key, format: :json)
end
