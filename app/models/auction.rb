class Auction < ApplicationRecord
  belongs_to :user, optional: true
  has_many :bids, dependent: :destroy
  has_many :comments, dependent: :destroy
  validates_presence_of :title, :description, :start_date, :end_date
end
