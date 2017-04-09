class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %w(edit update show)

  def create
  	@order = Order.create(orders_params)
  	if @order.save
  	  flash[:success] = "Successfully placed the order."
      redirect_to @order
    else
      flash[:danger] = "Something went wrong."
      redirect_to :back
    end    
  end

  def update

  end

  def index
  	@orders = current_user.orders.where("status != (?)", 3)
  end

  def show
  end

  private
  def orders_params
  	params.require(:order).permit(:quantity, :product_id, :address, :mobile_no, :status)
  end

  def set_order
  	@order = Order.find(params[:id])
  end
end
