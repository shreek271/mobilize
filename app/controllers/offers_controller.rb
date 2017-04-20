class OffersController < ApplicationController
  before_action :authenticate_user!, only: %w(edit update create destroy)
  before_action :verify_admin, only: %w(edit update create destroy)
  before_action :set_offer, only: %w(edit update show destroy)

  def new
  	@offer = Offer.new
  end

  def create
  	@offer = Offer.create(offers_params)
  	redirect_to @offer
  end

  def update
    @offer.update_attributes(offers_params)
    redirect_to @offer
  end

  def show
    @offers = Offer.all
  end

  def index
  	@offers = Product.joins(:offers)
  end

  def destroy
    if @offer.destroy
      flash[:success] = "Brand successfully deleted"
      redirect_to :back
    end
  end


private
  def offers_params
  	params.require(:offer).permit(:from_time, :to_time, :product_id)
  end

  def set_offer
      @offer = Offer.find(params[:id])
  end
end
