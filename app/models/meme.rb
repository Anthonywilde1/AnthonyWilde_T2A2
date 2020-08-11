class Meme < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :comments
  has_one_attached :image

  accepts_nested_attributes_for :user
  #created enums for category to make a category search later on (may add additional categories currently: 4)
  enum category: { pepe: 0, doge: 1, spider_man: 2, video_game: 3, meme_man: 4 , rails: 5 }

  # to ensure name is not nil and within 1-200 characters
  validates :name, length: { within: 1..200, message: "Meme must be between 5 to 200 characters"}
  #to ensure there is an image assosciated with the Meme which is the vital part to any meme
  #had trouble with AWS for image
  #validates :image, presence: { message: "Image must exist for meme to be created"}
  #to ensure that someone states whether their meme is for sale or not
  validates :for_sale, inclusion: { in: [true,false]}
  validates :for_sale, exclusion: { in: [nil], message: "Please state whether the meme is for sale or not"}
  # to ensure that a meme has a price when created for the marketplace
  validates :price, numericality: { message: "This is a marketplace please states a price"}
  validates :price, numericality: {less_than: 999999, message: "Meme must be worth less then 999,999"}



end
