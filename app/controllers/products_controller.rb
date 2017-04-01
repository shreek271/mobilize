class ProductsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    @product = Product.create(products_params)
    params[:product][:picture].each do |picture|      
      @product.images.create(:picture=> picture)
    end
    @product = Product.new
    respond_to do |format|
      format.html{ render(:text => "not implemented") }
      format.js
    end
  end

  def show
    @product = Product.find(params[:id])
    @brands = Brand.all
  end

  def index
  end

  def update
  end

  def delete
  end

  private

  def products_params
  	params.require(:product).permit(:name, :price, :quantity, :model, :color, :brand_id, :type_id, :picture)
  end

end
