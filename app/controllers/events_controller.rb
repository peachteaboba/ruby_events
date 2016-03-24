class EventsController < ApplicationController
  before_action :require_login
  before_action :require_correct_user, only: [:create]


  def index
    @events_here = Event.where(state: current_user.state)
    @events_not_here = Event.where.not(state: current_user.state)
    # render json: @events_here
    @event_id = User.find(session[:user_id]).joins.pluck(:event_id)





  end


  def create
    temp = event_params
    temp[:user_id] = params[:id]
    e = Event.new(temp)
    if e.save
      redirect_to "/events"
    else
      #errors
      flash[:errors] = e.errors.full_messages
      redirect_to :back
    end
  end


  def show
    @event = Event.find(params[:id])

    @joined_users = Join.where(event_id: params[:id]).joins(:user).select("*")

    @comments = Comment.where(event_id: params[:id])





  end


  def edit
    @event = Event.find(params[:id])
  end


  def update
    @event= Event.find(params[:id])
    if @event.update(event_params)
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end




  def destroy
    @event = Event.find(params[:id]).destroy
    redirect_to '/events'
  end



  def join


    redirect_to '/events'
  end












  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def event_params
    params.require(:event).permit(:name, :date, :city, :state)
  end


end
