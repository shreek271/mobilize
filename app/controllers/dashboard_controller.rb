class DashboardController < ApplicationController
	before_action :authenticate_user!
	before_action :verify_admin

	def show
	  @brands = Brand.all
	  @types = Type.all
	  @product = Product.new
	  @brand = Brand.new
	  @type = Type.new
	end
end
