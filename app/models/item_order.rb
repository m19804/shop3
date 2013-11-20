class ItemOrder < ActiveRecord::Base
  belongs_to :order
  belongs_to :item

  validates :order_id, :quantity, :item_id, :price, presence: true
  validates :order_id, :quantity, :item_id, numericality: {only_integer:true, greater_than: 0}
  validates :price, numericality: {greater_than: 0}

end
