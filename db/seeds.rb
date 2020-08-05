# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
    User.create(username: "Carlsan", email:"Carlsan@daijobu.com", password: "123456")
    User.create(username: "Zebbu", email: "Zeb@Zeb.com", password: "turtleneckndchain")
    User.create(username: "Anfii", email: "Anfii@Anfii.com", password: "Therealanfii")
    #Made some "memes"
    User.first.memes.create(name: "Spiderman", description: "funny", price: 2.50, category: 3, for_sale: true)
    User.first.memes.create(name: "Mememan", description: "hahahehehaha", price: 5.50, category: 4, for_sale: true)
    User.find(2).memes.create(name: "Doge", description: "woofer", price: 10, category: 1, for_sale: false)
    User.find(3).memes.create(name: "Rare Pepe", description: "platinum pepe", price: 500, category: 0, for_sale: false)
    #generating some comments
    Comment.create(comment: "wow please sell me this I will pay you big $$$", user_id: 1, meme_id: 4)
    Comment.create(comment: "What a good boi", user_id: 3, meme_id: 3)
    Meme.find(2).comments.create(comment: "Stonks", user_id: 3)
    