class BidsController < ApplicationController
  before_action :set_auction
  before_action :set_auction_bid, only: [:show, :update, :destroy]

  # GET /auctions/:auction_id/bids
  def index
    json_response(@auction.bids)
  end

  #GET /auctions/:auction_id/bids/:id
  def show
    json_response(@auction)
  end

  # POST /auctions/:auction_id/bids
  def create
    @auction.bids.create!(bid_params)
    json_response(@auction, :created)
  end

  # PUT /auctions/:auction_id/bids/:id
  def update
    @bid.update(bid_params)
    head :no_content
  end

  # DELETE /auctions/:auction_id/bids/:id
  def destroy
    @bid.destroy
    head :no_content
  end

  private

  def bid_params
    params.permit(:amount, :bidder_id)
  end

  def set_auction
    @auction = Auction.find(params[:auction_id])
  end

  def set_auction_bid
    @bid = @auction.bids.find_by!(id: params[:id]) if @auction
  end
end
