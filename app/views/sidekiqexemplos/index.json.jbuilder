json.array!(@sidekiqexemplos) do |sidekiqexemplo|
  json.extract! sidekiqexemplo, :id, :tipo, :codigo
  json.url sidekiqexemplo_url(sidekiqexemplo, format: :json)
end
