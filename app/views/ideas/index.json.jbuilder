json.array!(@ideas) do |idea|
  json.extract! idea, :id, :desc
  json.url idea_url(idea, format: :json)
end
