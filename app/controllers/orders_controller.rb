class OrdersController < ApplicationController
  before_action :authenticate_user!
  before_action :set_order, only: %w(edit update show update_status)

  def create
  	@order = Order.create(orders_params)
    @order.user_id = current_user.id
  	if @order.save
      OrderMailer.send_new_order_email(@order).deliver_now
  	  flash[:success] = "Successfully placed the order."
      redirect_to @order
    else
      render 'new'
    end    
  end

  def index
    if current_user.admin?
      @orders = Order.all.paginate(page: params[:page], per_page: 20)
    else
  	  @orders = current_user.orders.where("status != (?)", 3).paginate(page: params[:page], per_page: 20)
    end
  end

  def update_status
    if @order.update_attributes(status: params[:order][:status])
      flash[:success] = "Request Successfull"
      redirect_to :back
    end
  end

  private
  def orders_params
  	params.require(:order).permit(:quantity, :product_id, :user_id, :mobile_no, :status, :area, :pin_code, :line_one, :landmark)
  end

  def set_order
  	@order = Order.find(params[:id] || params[:order_id])
  end
end
