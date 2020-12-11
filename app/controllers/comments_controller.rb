class CommentsController < ApplicationController
  before_action :set_title

  def index
    @comment = Comment.new
    @comments = @title.comments.includes(:user)
  end

  def create
    @comment = @title.comments.new(comment_params)
    if @comment.save
      redirect_to title_comments_path(@title)
    else
      @comments = @title.comments.includes(:user)
      render :index
    end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id)
  end

  def set_title
    @title = Title.find(params[:title_id])
  end

end