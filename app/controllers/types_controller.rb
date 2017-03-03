class TypesController < ApplicationController

  before_action :authenticate_user!
  before_action :verify_admin
  
  before_action :set_type, only: %w(edit update)

  def create
  	Type.create(types_params)
  	@type = Type.new
  	@types = Type.all
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
    @type.update_attributes(types_params)
    respond_to do |format|
      format.html
      format.js
    end
  end

  private
	def types_params
	  params.require(:type).permit(:name)
	end

  def set_type
    @type = Type.find(params[:id])
  end

end
