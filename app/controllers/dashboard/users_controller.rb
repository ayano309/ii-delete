class Dashboard::UsersController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"

  def index
    if params[:keyword].present?
      @keyword = params[:keyword].strip
      @users = User.search_information(@keyword)
    else
      @keyword = ""
      @users = User.all.order(created_at: :desc)
    end
  end
  
  def destroy
  end
end
