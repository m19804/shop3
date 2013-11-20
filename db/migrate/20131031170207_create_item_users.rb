class CreateItemUsers < ActiveRecord::Migration
  def change
    create_table :item_users do |t|
      t.integer :item_id
      t.integer :quantity, default: 1
      t.timestamps
    end
  end
end
