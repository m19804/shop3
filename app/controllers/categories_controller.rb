class CategoriesController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]


  def index
    @categories = Category.all

  end

  def new
    @category = Category.new

  end

  def create
    @category = Category.new params[:category].permit(:name)
    if @category.save
      redirect_to categories_path
    else
      render "new"
    end

  end

  def edit
    @category = Category.find params[:id]
  end

  def update
    #найти категорию, которую мы хотим сохранить
    @category = Category.find params[:id]

    #  обновить ее свойства
    if @category.update_attributes params[:category].permit(:name)

    #перейти на список категорий
      redirect_to categories_path
    else
      render "edit"
    end

  end

  def destroy
     #  найти категорию
    @category = Category.find params[:id]

    #  удалить ее
    @category.destroy

    #  вернуться на список категорий
    redirect_to categories_path


  end

  def show

    @category = Category.find params[:id]

  end



end
