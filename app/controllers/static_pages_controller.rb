class StaticPagesController < ApplicationController

  def home
  	@brands = Type.first.brands.distinct
  	@latest = Product.where(latest: true)
    @offer_count = Offer.count
  end

  def opinion
    if params[:description].present?
      OpinionMailer.send_opinion_email(params[:firstname], params[:description]).deliver
      flash[:success] = "Feedback sent successfully"
    else
      flash.now[:danger] = "Please enter Feedback!"
    end
    redirect_to root_path
  end

end
