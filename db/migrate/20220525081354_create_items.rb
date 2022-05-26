class CreateItems < ActiveRecord::Migration[6.1]
  def change
    create_table :items do |t|
      t.string :name, null: false
      t.text :content, null: false
      t.integer :remaining_item, default: 100, null: false
      t.timestamps
    end
  end
end
