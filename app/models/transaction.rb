class Transaction < ApplicationRecord
  belongs_to :user
  belongs_to :meme

  #TO DO
  #fix if have additional time
  #validates :counter, message: "meme has been traded #{:counter} times"
end
