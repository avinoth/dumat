json.array!(@requests) do |request|
  json.extract! request, :id, :name, :url, :description
  json.url request_url(request, format: :json)
end
