class BidsController < ApplicationController
  before_action :authenticate_user, only: [:create, :index]

  def new

  end

  def create
    @bid = Bid.new bid_params
    @auction = Auction.find(params[:auction_id])
    @bid.auction = @auction
    @bid.user = current_user
      if @bid.save
        @auction.current_price = @bid.amount
        @auction.save
        redirect_to @auction, notice: "Bid submitted!"
      else
        redirect_to @auction, notice: "Bid not created!"
      end
  end

  def index
    @bids = current_user.bids
  end

  private

  def bid_params
    params.require(:bid).permit(:amount)
  end


end
