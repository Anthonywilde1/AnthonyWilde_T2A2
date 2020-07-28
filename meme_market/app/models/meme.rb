class Meme < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :comments
  #created enums for category to make a category search later on (may add additional categories currently: 4)
  enum category: { pepe: 0, doge: 1, spider_man: 2, video_game: 3, meme_man: 4 }
end
