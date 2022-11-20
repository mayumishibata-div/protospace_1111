class CommentsController < ApplicationController
  def create
    @prototype = Prototype.find(params[:id])
    @comment = @prototype.comments.new(comment_params)
    @comment.save
  end

  private
  def comment_params
    params.require(:comment).permit(:content).merge(user_id: current_user.id, prototype_id: params[:prototype.id])
  end
end
