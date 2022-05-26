class Dashboard::ReservationsController < ApplicationController
  before_action :authenticate_admin!
  layout "dashboard/dashboard"

  def index
    @reservations = Reservation.all.order(capacity_id: 'desc')
  end

  def show

  end

  def new
    
  end

  def create
    
  end

  def edit
    
  end

  def update
    
  end

  def destroy
  
  end


end
