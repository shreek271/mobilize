class UsersController < ApplicationController
  before_action :authenticate_user!
  before_action :verify_admin, only: %w(index)

  def index
  	@users = User.all.paginate(page: params[:page], per_page: 50)
  end
end
