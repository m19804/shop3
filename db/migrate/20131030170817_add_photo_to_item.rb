class AddPhotoToItem < ActiveRecord::Migration
  def up
    add_attachment :items, :photo

  end

  def down
    remove_attachment :items, :photo
  end
end
