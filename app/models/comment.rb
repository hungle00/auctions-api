class Comment < ApplicationRecord
  belongs_to :auctions
  belongs_to :users
end
