Timezone::Lookup.config(:google) do |c|
  c.api_key = ENV['GOOGLE_MAPS_API_KEY']
end
