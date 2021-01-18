require 'rails_helper'

RSpec.describe BiddingEngine do
  describe ".bid!" do
    it "create new bid" do
      seller = User.create!(:email => 'steve@email.com', :password => 'steve00')			  
      bidder = User.create!(:email => 'steve@email.com', :password => 'steve00')
    
      auction = Auction.create(title: 'Hello World', description: 'Hello World',
			       start_date: DateTime.now, end_date: DateTime.now + 1.week,
			       user_id: seller.id)
      described_class.bid!(auction, 100, bidder)
      expect(auction.errors).to be_empty

      described_class.bid!(auction, 100, bidder)
      expect(auction.errors[:bid].first).to eq "must be bigger than the last bid on the auction"
    end
  end
end
