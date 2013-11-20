class CreateItems < ActiveRecord::Migration
  def change
    create_table :items do |t|
      t.float :raiting
      t.float :price
      t.string :name
      t.text :description

      t.timestamps
    end
  end
end
