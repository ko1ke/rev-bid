class BidsController < ApplicationController
  before_action :set_auction, :my_auction?

  def index
    @bids = @auction.bids.asc_price
    impressionist(@auction, nil, unique: [:session_hash])
  end

  def new
    @bid = @auction.bids.new
  end

  def create
    @bid = @auction.bids.new(bid_params)
    @bid.user_id = current_user.id

    respond_to do |format|
      if @bid.save
        format.html do redirect_to auction_bids_url, notice: '新規入札が登録されました'
        end
      else
        format.html { render :new }
      end
    end
  end

  private
    def set_auction
      @auction = Auction.find(params[:auction_id])
    end

    def my_auction?
      if @auction.user.id == current_user.id
        redirect_to root_path, notice: '権限がありません'
      end
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bid_params
      params.require(:bid).permit(:price,
                                  :suggestion,
                                  :image,
                                  :image_cache,
                                  :auction_id)
    end
end
