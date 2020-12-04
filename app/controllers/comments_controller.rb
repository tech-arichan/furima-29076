class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
  end

  def destroy
    @comment.destroy
  end

  private

  def comment_params
    params.require(:comment).permit(:commet, :item_id).merge(user_id: current_user.id)
  end
end
