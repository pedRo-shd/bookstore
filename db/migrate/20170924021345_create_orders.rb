class CreateOrders < ActiveRecord::Migration[5.1]
  def change
    create_table :orders do |t|
      t.references :person, foreign_key: true, index: true, null: false
      t.references :book, foreign_key: true, index: true, null: false
      t.integer :quantity, null: false
      t.decimal :value, precision: 15, scale: 2, null: false

      t.timestamps
    end
  end
end
