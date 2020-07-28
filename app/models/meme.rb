class Meme < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :comments
  #created enums for category to make a category search later on (may add additional categories currently: 4)
  enum category: { pepe: 0, doge: 1, spider_man: 2, video_game: 3, meme_man: 4 }

  # to ensure name is not nil and within 1-200 characters
  validates :name, presence: true, length: { within: 1..200, message: "Meme must be between 5 to 200 characters"}
  #to ensure there is an image assosciated with the Meme which is the vital part to any meme
  validates :image, presence: true, message: "A Meme must have an image"
  #to ensure that someone states whether their meme is for sale or not
  validates :for_sale, inclusion: { in: [true,false]}
  validates :for_sale, exclusion: { in: [nil] message: "Please state whether the meme is for sale or not"}
  # to ensure that a meme has a price when created for the marketplace
  validates :price, numericality: true, message: "This is a marketplace please states a price"



end
