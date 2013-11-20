class PostsController < ApplicationController

  before_filter :authenticate_user!, except: [:index, :show]


  def index
    @posts = Post.all

  end

  def new
    @post = Post.new



  end

  def create
    @post = Post.new(params[:post].permit(:title, :description))
    @post.save
    redirect_to posts_path

    if @post.save
      redirect_to posts_path
    else
      render "new"
    end

  end

  def edit
    @post = Post.find params[:id]

  end

  def update
    @post = Post.find params[:id]
    @post.update params[:post].permit(:title, :description)
    redirect_to posts_path

    if @post.save
      redirect_to posts_path
    else
      render "edit"
    end

  end

  def destroy
    @post = Post.find params[:id]
    @post.destroy
    redirect_to posts_path


  end

  def show
    @post = Post.find params[:id]

  end



end
