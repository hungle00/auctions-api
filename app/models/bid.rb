class Bid < ApplicationRecord
  belongs_to :bidder, class_name: "User"
  belongs_to :auction

  validates_presence_of :bidder

  after_create :create_activites

  def seller
    auction.user
  end

  private

  def create_activites
    create_activity_for_bidder
    create_activity_for_seller
  end

  def create_activity_for_bidder
    Activity.create!(
      subject: self,
      name: 'bid_offered',
      direction: 'from',
      user: bidder
    )
  end

  def create_activity_for_seller
    Activity.create!(
      subject: self,
      name: 'bid_offered',
      direction: 'to',
      user: seller
    )
  end
end
