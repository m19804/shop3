class CreateComments < ActiveRecord::Migration
  def change
    create_table :comments do |t|
      t.text :message
      t.integer :item_id
      t.integer :rating
      t.string :name, default: "Guest"
      t.timestamps
    end
  end
end
