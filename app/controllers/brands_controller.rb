class BrandsController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin
  
  before_action :set_brand, only: %w(edit update)
  
  def create
  	Brand.create(brands_params)
  	@brand = Brand.new
  	@brands = Brand.all
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

  private

    def brands_params
  	  params.require(:brand).permit(:name)
    end

    def set_brand
      @brand = Brand.find(params[:id])
    end

end
