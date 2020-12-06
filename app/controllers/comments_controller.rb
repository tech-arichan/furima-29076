class CommentsController < ApplicationController

  def create
    @comment = Comment.new(comment_params)
    @comment.save
    redirect_to item_path(@comment.item.id)
  end

  def destroy
    @comment = Comment.find(params[:id])
    @item = Item.find(params[:id])
    @comment.destroy
    # if @comment.user_id != current_user.id
    #   flash[:alert] = "その操作はできません"
    #   redirect_to root_path
    # end
  end

  private

  def comment_params
    params.require(:comment).permit(:comment).merge(user_id: current_user.id, item_id: params[:item_id])
  end

end
