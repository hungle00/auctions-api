class CommentSerializer < ActiveModel::Serializer
  attributes :id, :body
  has_one :auctions
  has_one :users
end
