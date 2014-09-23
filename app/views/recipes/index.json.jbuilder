json.array!(@recipes) do |recipe|
  json.extract! recipe, :id, :name, :method, :source, :tip, :serving
  json.url recipe_url(recipe, format: :json)
end
