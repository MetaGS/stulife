json.array! @car_vendors do |car_vendor|
  json.id           car_vendor.id
  json.title        car_vendor.name
  json.lat          car_vendor.latitude.to_f
  json.lng          car_vendor.longitude.to_f
  json.description  "#{link_to car_vendor.name, car_vendor_path(car_vendor, lat: car_vendor.latitude, lng: car_vendor.longitude)}<br>#{car_vendor.cars.count} Listing<br>RM#{car_vendor.min_price} to RM#{car_vendor.max_price}"
end