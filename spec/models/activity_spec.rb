require 'rails_helper'

RSpec.describe Activity, type: :model do
  describe "Associations" do
    it { should belong_to(:user) }
  end

  describe "create activity" do
    seller = User.create(:email => 'steve@email.com', :name => 'steve', :password => 'steve00')			  
    bidder = User.create(:email => 'steve@email.com', :name => 'steve', :password => 'steve00')
  
    auction = Auction.create(title: 'Hello World', description: 'Hello World',
           start_date: DateTime.now, end_date: DateTime.now + 1.week,
           user_id: seller.id)
    bid = Bid.create(:amount => 50, :bidder_id => bidder.id, :auction_id => auction.id)

    it "test user_id" do
      expect(described_class.first.user_id) == 2
    end

    it "test name" do
      expect(described_class.first.name).to eq "bid_offered"
    end
  end
end
