json.array! @houses do |house|
  json.id           house.id
  json.label        house.property_type[0]
  json.title        house.name
  json.lat          house.latitude.to_f
  json.lng          house.longitude.to_f
  json.description  "#{link_to house.name, house_path(house, lat: house.latitude, lng: house.longitude)}<br>#{house.property_type}<br>#{house.house_units.count} Listing<br>RM#{house.min_price} to RM#{house.max_price}"
end