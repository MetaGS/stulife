Admin.create(email: "chinwei.chee@gmail.com", password: "random1234", password_confirmation: "random1234")
Admin.create(email: "soogarjun@gmail.com", password: "random1234", password_confirmation: "random1234")
Admin.create(email: "sohcheehong96@gmail.com", password: "random1234", password_confirmation: "random1234")

Country.create(name: "Malaysia", slug: "malaysia")

University.create(name: "Taylor's University", slug: "taylor-university", country: Country.where(name: "Malaysia").first, description: "Welcome to Taylor's University")
