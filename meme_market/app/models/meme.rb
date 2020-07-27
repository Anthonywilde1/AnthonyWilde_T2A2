class Meme < ApplicationRecord
  belongs_to :user
  has_many :transactions
  has_many :comments
end
