class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to item_path(@comment.item.id)
  end

  def destroy
    @comment = Comment.find_by(id: params[:id], item_id: params[:item_id])
    @comment.destroy
    redirect_to item_path(@comment.item.id)
    # terminal[item_comment DELETE /items/:item_id/comments/:id(.:format)      comments#destroy]
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
