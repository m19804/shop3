class CreateItemOrders < ActiveRecord::Migration
  def change
    create_table :item_orders do |t|
      t.integer :item_id
      t.integer :quantity
      t.float :price
      t.integer :order_id
      t.timestamps
    end
  end
end
