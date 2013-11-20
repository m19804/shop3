class AddSpecialToItems < ActiveRecord::Migration
  def change
    add_column :items, :special, :text

  end
end
