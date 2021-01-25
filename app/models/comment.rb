class Comment < ApplicationRecord
  belongs_to :auction
  belongs_to :user

  validates_presence_of :body

  after_create :create_activities

  def seller
    auction.user
  end

  private

  def create_activities
    (commenters_on_auction + [seller]).uniq.each do |user|
      Activity.create!(
        subject: self,
        name: 'comment_posted',
        direction: 'to',
        user: user
      )
    end
  end

  def commenters_on_auction
    Comment.where(auction_id: auction.id).map(&:user).uniq
  end
end
