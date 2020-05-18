# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

user1 = User.new(
    :email                 => "abc@abc.com",
    :password              => "123456",
    :password_confirmation => "123456"
)
user1.save!

user2 = User.new(
    :email                 => "def@def.com",
    :password              => "123456",
    :password_confirmation => "123456"
)
user2.save!

sizes = [
  "Small",
  "Medium",
  "Large"
]

size_objects = []

sizes.each do |size|
  size_objects.push(Size.create(size: size))
end

user1.listings.create(title: "TITLE", model: "MODEL", description: "DESCRIPTION", size_id: size_objects[0].id, price: 100, location: "LOCATION", postcode: 1000)

user1.listings.create(title: "TITLE", model: "MODEL", description: "DESCRIPTION", size_id: size_objects[0].id, price: 100, location: "LOCATION", postcode: 1000)

user2.listings.create(title: "TITLE2", model: "MODEL2", description: "DESCRIPTION2", size_id: size_objects[1].id, price: 200, location: "LOCATION2", postcode: 2000)