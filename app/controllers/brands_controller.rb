class BrandsController < ApplicationController
  
  before_action :authenticate_user!, only: %w(edit update create destroy)
  before_action :verify_admin, only: %w(edit update create destroy) 
  before_action :set_brand, only: %w(edit update show destroy)
  
  def create
  	Brand.create(brands_params)
  	@brand = Brand.new
  	@brands = Type.first.brands.distinct
  	respond_to do |format|
  	  format.html
      format.js
  	end
  end

  def edit
   respond_to do |format|
      format.html
      format.js
    end
  end

  def update
    @brand.update_attributes(brands_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  def show
    @brands = Type.first.brands.distinct
  end

  def index
    @brands = Type.first.brands
    @types = @brands.joins(:types).pluck('types.name').uniq
    @products = Product.all
    @first_products = @products.where(type_id: Type.find_by_name(@types.first))
    @second_products = @products.where('id not IN (?)', @first_products.pluck(:id))
    @brands = @brands.distinct
  end

  def accessory
    brands = Type.first.brands.distinct
    @brands = Brand.all - brands
    if params[:accessory]
      @types = Brand.joins(:types).where("brands.id IN (?)", @brands.pluck(:id)).pluck('types.name').uniq
      @products = Product.all
      @first_products = @products.where(type_id: Type.find_by_name(@types.first))
      @second_products = @products.where('id not IN (?)', @first_products.pluck(:id))
    else
      @brand = Brand.find(params[:brand_id])
    end
  end

  def destroy
    if @brand.destroy
      flash[:success] = "Brand successfully deleted"
      redirect_to :back
    end
  end

  private

    def brands_params
  	  params.require(:brand).permit(:name, :logo)
    end

    def set_brand
      @brand = Brand.find(params[:id])
    end

end
