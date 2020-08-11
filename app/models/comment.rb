class Comment < ApplicationRecord
  belongs_to :user
  belongs_to :meme
  
  accepts_nested_attributes_for :user, :meme
  #comment must exist to be created
  validates :comment, length: {minimum: 1, message: "comment must have text"}
  
end
