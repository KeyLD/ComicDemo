class CommentsController < ApplicationController

  def create

    @comic = Comic.find(params[:comic_id])
    @comment = @comic.comments.build(comment_params)
    @comment.user_id = current_user.id #当前用户

    if @comment.save
      flash[:success] = 'success'
      # format.html {redirect_to commentable_record, notice: '创建评论成功'}
      # format.json {render json: @comment, status: :created, location: commentable_record}
    else
      flash[:alert] ='failed'
      # format.html {render action: :new}
      # format.json {render json: @comment.errors, status: :unprocessable_entity}
    end
    redirect_to comic_path(@comic.id)

  end

  protected

  def comment_params
    params.require(:comment).permit(:content, :user_id, :comic_id)
  end
end
