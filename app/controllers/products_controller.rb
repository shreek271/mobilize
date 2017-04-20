class ProductsController < ApplicationController
  
  before_action :authenticate_user!, only: %w(edit update create destroy)
  before_action :verify_admin, only: %w(edit update create destroy)
  before_action :set_product, only: %w(edit update show destroy)

  def create
    @product = Product.create(products_params)
    params[:product][:picture].each do |picture|      
      @product.images.create(:picture=> picture)
    end
    flash[:success] = "Product created."
    redirect_to :back
  end

  def show
    @product = Product.find(params[:id])
    @brands = Type.first.brands.distinct
    @order = Order.new
  end

  def update
    if @product.update_attributes(products_params)
      if params[:product][:picture].present? 
        params[:product][:picture].each do |picture|      
          @product.images.create(:picture=> picture)
        end
      end
      flash[:success] = "Successfully updated the product."
      redirect_to @product
    else
      flash[:danger] = "Something went wrong."
      render :edit
    end
  end

  def destroy
    if @product.destroy
      flash[:success] = "Brand successfully deleted"
      redirect_to @product.brand
    end
  end

  private

  def products_params
  	params.require(:product).permit(:name, :price, :quantity, :discount, :latest, :highlight, :color, :brand_id, :type_id, :picture, :camera, :general, :display, :software, :connectivity, :memory, :battery, :dimensions)
  end

  def set_product
    @product = Product.find(params[:id]||params[:product_id])
  end

end
