class User < ApplicationRecord
  before_create :meme_array, :capital
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :memes
  has_many :transactions
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  #puts memes into an array for users
  def meme_array
  self.memes = []
  end

  def capital
    self.username = username.capitalize
  end
  #to ensure Usernames arent blank AND too long
  validates :username, length: {within: 5..50, message:"Username must be within 5 - 50 Characters"}

end
