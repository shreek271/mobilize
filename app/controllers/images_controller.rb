class ImagesController < ApplicationController
  before_action :authenticate_user!, only: %w(destroy)
  before_action :verify_admin, only: %w(destroy)

  def destroy
    @image = Image.find(params[:id])
    if @image.destroy
      flash[:success] = "Image successfully deleted"
      redirect_to :back
    end
  end
end
