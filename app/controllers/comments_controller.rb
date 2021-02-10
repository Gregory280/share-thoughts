class CommentsController < ApplicationController
  before_action :authenticate_user!



  def create
    @comment = @commentable.comments.new(comment_params)
    @comment.user = current_user
    @comment.save
    redirect_to request.referrer, notice: "Comentário realizado com sucesso"
    #Antes era redirect_to @commentable
  end

  private

  def comment_params
    params.require(:comment).permit(:body)
  end

end
