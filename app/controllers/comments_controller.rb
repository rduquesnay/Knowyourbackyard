class CommentsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create]
  before_action :ensure_admin!, only: :destroy
  respond_to :html
  def new
    @comment = Comment.new
    respond_with(@comment)
  end

  def create
    @comment = Comment.new(comment_params)
    if @comment.save
      redirect_to trail_url(@comment.trail_id)
    else
      redirect_to 'new'
    end
  end
  def destroy
    @comment = Comment.find(params[:id])
    @comment.destroy
    respond_with(@comment)
  end

  private
    def comment_params
      params.require(:comment).permit(:message,:trail_id,:user_id)
    end
end
