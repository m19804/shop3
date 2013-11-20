class Comment < ActiveRecord::Base
  belongs_to :item
  validates :message, :name, presence: true
  validates :rating, numericality: {greater_than: 0, less_than_or_equal_to: 5, only_integer: true}
end
