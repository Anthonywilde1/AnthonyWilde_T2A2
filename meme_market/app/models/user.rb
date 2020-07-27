class User < ApplicationRecord
  before_create :meme_array
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  has_many :memes
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  def meme_array
  self.meme = []
  end

end
