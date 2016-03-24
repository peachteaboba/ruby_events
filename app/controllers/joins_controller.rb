class JoinsController < ApplicationController
  before_action :require_login
  # before_action :require_correct_user_likes
  def create
    event = Event.find(params[:id])
    Join.create(user: current_user, event: event)
    redirect_to :back
  end
  def destroy
    event = Event.find(params[:id])
    Join.find_by(user: current_user, event: event).destroy
    redirect_to :back
  end

end
