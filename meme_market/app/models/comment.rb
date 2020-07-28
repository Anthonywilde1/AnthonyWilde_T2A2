class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meme

  validates :comment, length: {minimum: 1, message: "comment must have text"}
  
end
