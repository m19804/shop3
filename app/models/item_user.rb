class ItemUser < ActiveRecord::Base
  belongs_to :item
  belongs_to :user


  validates :item_id, :user_id, :quantity,
            presence: true,
            numericality: {
                only_integer: true,
                greater_than: 0
            }

  #считает полную сумму содержимого корзины
  # @param user [user], объект пользователя, для которого считаем корзину
  # @return Float
  def self.total_price(user)
     # Посчитать
     #сумма которую будем считать

    total = 0.0

    #перебираем все записи из корзины и меняем сумму

    user.item_users.each do |item_user|
     total = total + item_user.full_price



    end

    #вернуть результат
    total

  end
 #считает стоимость текущей позиции в корзине _ если товаров одного наименования

 def full_price
   quantity * item.price

 end



end
