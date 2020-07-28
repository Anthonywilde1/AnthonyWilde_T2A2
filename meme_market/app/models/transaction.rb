class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :meme

  validates :counter, message: "meme has been traded #{:counter} times"
end
