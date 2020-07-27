class User < ApplicationRecord
  before_create :meme_array
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :memes
  has_many :transactions
  has_many :comments
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def meme_array
  self.memes = []
  end

end
