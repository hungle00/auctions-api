class Bid < ApplicationRecord
  belongs_to :bidder, class_name: "User"
  belongs_to :auction

  validates_presence_of :bidder

  after_create :create_activites

  private

  def create_activites
    Activity.create!(
      name: 'bid_offered',
      direction: 'from',
      user: bidder
    )
  end
end
