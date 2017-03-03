class DashboardController < ApplicationController
	before_action :authenticate_user!

	def show
	  @brands = Brand.all
	  @types = Type.all
	  @product = Product.new
	  @brand = Brand.new
	  @type = Type.new
	end
end
