class CreateReservations < ActiveRecord::Migration[6.1]
  def change
    create_table :reservations do |t|
      t.integer :number_of_items, null: false
      t.integer :visiting_time, null: false
      t.date :start_time, null: false
      t.integer :reservation_status, default: 0, null: false
      t.references :user, foreign_key: true
      t.references :item, null: false, foreign_key: true
      t.timestamps
    end
  end
end
