class ProductsController < ApplicationController
  
  before_action :authenticate_user!, only: %w(edit update create)
  def create
    @product = Product.create(products_params)
    params[:product][:picture].each do |picture|      
      @product.images.create(:picture=> picture)
    end
    redirect_to :back
  end

  def show
    @product = Product.find(params[:id])
    @brands = Brand.all
    @order = Order.new
  end

  def index
  end

  def update
  end

  def delete
  end

  private

  def products_params
  	params.require(:product).permit(:name, :price, :quantity, :discount, :highlight, :color, :brand_id, :type_id, :picture, :camera, :general, :display, :software, :connectivity, :memory, :battery, :dimensions)
  end

end
