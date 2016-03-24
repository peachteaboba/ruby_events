class CommentsController < ApplicationController
  before_action :require_login

  def create

    c = Comment.new(comment_params)
    if c.save
      redirect_to :back
    else
      #errors
      flash[:errors] = c.errors.full_messages
      redirect_to :back
    end
  end





  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def comment_params
    params.require(:comment).permit(:comment, :user_id, :event_id)
  end




end
