class Order < ActiveRecord::Base
  belongs_to :user
  has_many :item_orders, dependent: :destroy

  validates :user_id, :price, presence: true
  validates :user_id, numericality: {only_integer:true, greater_than: 0}
  validates :price, numericality: {greater_than: 0}

end
