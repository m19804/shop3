class AddUserIdToItemUser < ActiveRecord::Migration
  def change
    add_column :item_users, :user_id, :integer
  end
end
