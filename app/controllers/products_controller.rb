class ProductsController < ApplicationController
  
  before_action :authenticate_user!, only: %w(edit update create)
  before_action :verify_admin, only: %w(edit update create)
  before_action :set_product, only: %w(edit update show)

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

  def update
    if @product.update_attributes(products_params)
      flash[:success] = "Successfully updated the product."
      redirect_to @product
    else
      flash[:danger] = "Something went wrong."
      render :edit
    end
  end

  def delete
  end

  private

  def products_params
  	params.require(:product).permit(:name, :price, :quantity, :discount, :highlight, :color, :brand_id, :type_id, :picture, :camera, :general, :display, :software, :connectivity, :memory, :battery, :dimensions)
  end

  def set_product
    @product = Product.find(params[:id])
  end

end
