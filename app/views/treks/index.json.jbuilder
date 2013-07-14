json.array!(@treks) do |trek|
  json.extract! trek, :name
  json.url trek_url(trek, format: :json)
end
