module V1
  class CommentsController < ApplicationController
    before_action :set_auction
    before_action :set_auction_comment, only: [:show, :update, :destroy]
  
    # GET /auctions/:auction_id/comments
    def index
      json_response(@auction.comments)
    end
  
    # GET /auctions/:auction_id/comments/:id
    def show
      json_response(@comment)
    end
  
    # POST /auctions/:auction_id/comments
    def create
      @auction.comments.create!(comment_params)
      json_response(@auction, :created)
    end
  
    # PATCH/PUT /auctions/:auction_id/comments/:id
    def update
      @comment.update(comment_params)
      head :no_content
    end
  
    # DELETE /auctions/:auction_id/comments/:id
    def destroy
      @comment.destroy
      head :no_content
    end
  
    private
      # Use callbacks to share common setup or constraints between actions.
      def set_auction_comment
        @comment = @auction.comments.find_by!(id: params[:id]) if @auction
      end

      def set_auction
        @auction = Auction.find(params[:auction_id])
      end
  
      # Only allow a list of trusted parameters through.
      def comment_params
        params.require(:comment).permit(:body, :user_id)
      end
  end 
end