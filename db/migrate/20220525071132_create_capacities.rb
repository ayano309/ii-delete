class CreateCapacities < ActiveRecord::Migration[6.1]
  def change
    create_table :capacities do |t|
      t.date :start_time, null: false
      t.integer :remaining_item, default: 100, null: false
      t.timestamps
    end
  end
end
