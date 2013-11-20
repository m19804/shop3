class Item < ActiveRecord::Base
  validates :name, :price, presence: true
  validates :price, numericality: {greater_than_or_equal_to: 0.01}
  validates :name, length: {minimum: 2}
  validates :name, uniqueness: true
  belongs_to :category
  has_many :comments, dependent: :destroy
  has_many :item_users, dependent: :destroy
  has_many :item_orders, dependent: :destroy

  has_attached_file :photo,
                    :styles => {medium: "300x300>", thumb: "100x100>" },
                    default_url: "/images/:style/missing.png"

end
