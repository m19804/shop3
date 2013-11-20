class Post < ActiveRecord::Base
  #validates :title, description: true, message: "пусто не выйдет"
  validates :title, :description, presence: true, length: {:minimum => 3}

  end
