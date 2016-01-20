json.array! @universities do |university|
  json.id           university.id
  json.label        "U"
  json.icon         image_path('gicons/cramschool.png')
  json.title        university.name
  json.lat          university.latitude
  json.lng          university.longitude
  json.description  "#{link_to university.name, university_path(university)}"
end