class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.new
  end

  def create
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :phone, :number_of_items, :visiting_time, :reservation_status, :capacity_id, :user_id)
  end
end
