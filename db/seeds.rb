# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup}).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }]})
#   Mayor.create({name: 'Emanuel', city: cities.first})
# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup}).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }]})
#   Mayor.create({name: 'Emanuel', city: cities.first})
Product.delete_all
Product.create! id: 1, name: 'Thai 60m', price: 60, active: true
Product.create! id: 2, name: 'Thai 90m', price: 80, active: true
Product.create! id: 3, name: 'Thai 120m', price: 100, active: true
Product.create! id: 4, name: 'Herbal 60m', price: 65, active: true
Product.create! id: 5, name: 'Herbal 90m', price: 85, active: true
Product.create! id: 6, name: 'Herbal 120m', price: 110, active: true
Product.create! id: 7, name: 'Prenatal 60m', price: 50, active: true
Product.create! id: 8, name: 'Prenatal 90m', price: 80, active: true
Product.create! id: 9, name: 'Prenatal 120m', price: 105, active: true
Product.create! id: 10, name: 'Swedish 60m', price: 70, active: true
Product.create! id: 11, name: 'Swedish 90m', price: 95, active: true
Product.create! id: 12, name: 'Swedish 120m', price: 120, active: true
Product.create! id: 13, name: 'Reflexology 60m', price: 40, active: true
Product.create! id: 14, name: 'Reflexology 90m', price: 70, active: true
Product.create! id: 15, name: 'Reflexology 120m', price: 90, active: true
Product.create! id: 16, name: 'Sports 60m', price: 60, active: true
Product.create! id: 17, name: 'Sports 90m', price: 85, active: true
Product.create! id: 18, name: 'Sports 120m', price: 110, active: true
Product.create! id: 19, name: '5 pack', price: 300, active: true
Product.create! id: 20, name: '10 pack', price: 500, active: true
Product.create! id: 21, name: 'VIP', price: 1000, active: true

OrderStatus.delete_all
OrderStatus.create! id: 1, name: 'In Progress'
OrderStatus.create! id: 2, name: 'Placed'
OrderStatus.create! id: 3, name: 'Shipped'
OrderStatus.create! id: 4, name: 'Cancelled'
