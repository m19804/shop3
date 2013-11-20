class CommentsController < ApplicationController


  # GET /comments/new
  def new
    @comment = Comment.new
  end



  # POST /comments
  # POST /comments.json
  def create
    @comment = Comment.new(comment_params)


    if @comment.save
      #объявляем хранилище оценок
      all_scores = []

      #находим все оценки
      @comment.item.comments.each do |c|
        if c.rating
          all_scores << c.rating
        end
      end

      #если оценки есть
      if all_scores.any?

      #считаем среднее арифметическое
        sum =  all_scores.sum.to_f
        avg = sum / all_scores.length

      #сохраняем их к товару
        @comment.item.update_attribute :raiting, avg


      end

      redirect_to @comment.item, notice: 'Comment was successfully created.'
    else
      redirect_to @comment.item, alert: "Comment is not created"


    end
  end




  private

    # Never trust parameters from the scary internet, only allow the white list through.
    def comment_params
      params[:comment].permit(:name, :item_id, :message, :rating)
    end
end
