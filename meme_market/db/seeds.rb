# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    User.create(username: "Carl", email:"Carlsan@daijobu.com", password: "123456")
    User.create(username: "Zeb", email: "Zeb@Zeb.com", password: "turtleneckndchain")
    User.create(username: "Anfii", email: "Anfii@Anfii.com", password: "Therealanfii")
    User.create(username: "Dane", email: "Myfrienddane@Dane.com", password: "hadaneha")
    User.create(username: "Latchy", email: "Eggboi@eggboi.com", password: "heliketheeggs")
    User.first.memes.create(name: "Spiderman", description: "funny", image: "yes", price: 2.50, category: 3, for_sale: true)
    User.first.memes.create(name: "Mememan", description: "hahahehehaha", image: "sure", price: 5.50, category: 4, for_sale: true)
    User.find(2).memes.create(name: "Doge", description: "woofer", image: "here", price: 10, category: 1, for_sale: false)
    User.find(3).memes.create(name: "Rare Pepe", description: "platinum pepe", image: "maybe", price: 500, category: 0, for_sale: false)