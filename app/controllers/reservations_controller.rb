class ReservationsController < ApplicationController
  def index
    @reservation = Reservation.new
  end
  

  def create
    Reservation.transaction do
      # 入力された値(日付)からCapacityテーブルでデータを探し、capacity_idに代入
      capacity_id = Capacity.find_by(start_time: params[:reservation][:capacity_id]).id
      # 代入したcapacity_idをmerge、外部キーとしてidの値を挿入し予約情報のデータと共に作成、保存
      @reservation = Reservation.create!(reservation_params.merge(capacity_id: capacity_id))

      @reservation.capacity.update!(remaining_item: @reservation.capacity.remaining_item - @reservation.number_of_items)
      redirect_to root_path, success: '予約が完了しました。'
    end
  rescue StandardError
    redirect_to new_reservation_path, danger: '予約ができませんでした。x'
  end

  private

  def reservation_params
    params.require(:reservation).permit(:name, :email, :phone, :number_of_items, :visiting_time, :reservation_status, :capacity_id, :user_id)
  end
end
