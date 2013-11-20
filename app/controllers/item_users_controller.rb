class ItemUsersController < ApplicationController
  before_action :authenticate_user!

  # GET /item_users
  # GET /item_users.json
  def index
    @item_users = current_user.item_users
  end

  # GET /item_users/new
  def new
    @item_user = ItemUser.new
  end

  # POST /item_users
  # POST /item_users.json
  def create
    item = Item.find params[:item_user][:item_id]

    #Если в таблице   item_ugers есть товар

    item_user = ItemUser.where(user_id: current_user.id).where(item_id: item.id).first
    if item_user

      item_user.quantity = item_user.quantity + 1
      item_user.save
    else
      item_user = ItemUser.new
      item_user.item_id = item.id
      item_user.user_id = current_user.id
      item_user.quantity = 1
      item_user.save
    end

    redirect_to :back

  end

def update
   # Найти объект записи
  item_user = ItemUser.find(params[:id])
  #  Проверить владельца
    if item_user.user_id == current_user.id
  #  Изменить значение
      item_user.update quantity: params[:item_user][:quantity]
  #  Вернуться в корзину

  redirect_to :back
 end

end

  # DELETE /item_users/1
  # DELETE /item_users/1.json
  def destroy
    item_user = ItemUser.find(params[:id])
    if item_user.user_id == current_user.id
       item_user.destroy
    end
    redirect_to item_users_path

  end
end
