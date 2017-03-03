class ProductsController < ApplicationController
  
  before_action :authenticate_user!

  def create
    Product.create(products_params)
    @Product = Product.new
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
  end

  def index
  end

  def update
  end

  def delete
  end

  private

  def products_params
  	params.require(:product).permit(:name, :price, :quantity, :model, :color, :brand_id, :type_id)
  end

end
