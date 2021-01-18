class AuctionsController < ApplicationController
  before_action :set_auction, only: [:show, :update, :destroy]

  # GET /auctions
  def index
    @auctions = Auction.all
    json_response(@auctions)
  end

  # POST /auctions
  def create
    @auction = Todo.create!(todo_params)
    json_response(@auction, :created)
  end

  # GET /auctions/:id
  def show
    json_response(@auction)
  end

  # PUT /auctions/:id
  def update
    @auction.update(auction_params)
    head :no_content
  end

  # DELETE /auctions/:id
  def destroy
    @auction.destroy
    head :no_content
  end

  private

  def auction_params
    params.permit(:title, :description, :start_date, :end_date)
  end

  def set_auction
    @auction = Auction.find(params[:id])
  end
end
