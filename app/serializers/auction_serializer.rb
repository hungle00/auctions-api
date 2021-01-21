class AuctionSerializer < ActiveModel::Serializer
  attributes :id, :title, :description, :start_date, :end_date, :created_at
  has_many :bids
end
