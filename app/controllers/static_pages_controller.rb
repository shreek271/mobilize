class StaticPagesController < ApplicationController

  def home
  	@brands = Brand.all
  end

end
