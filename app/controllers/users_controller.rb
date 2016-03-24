class UsersController < ApplicationController
  before_action :require_login, except: [:new, :create, :login]
  before_action :require_correct_user, only: [:show, :edit, :update, :destroy]
  def new
  end

  def login
    @user = User.find_by(:email => login_params[:email])
    if @user && @user.authenticate(login_params[:password])
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      flash[:errors] = ["Invalid Email or Password"]
      redirect_to :back
    end

  end

  def logout
    session[:user_id] = nil
    redirect_to '/'
  end


  def create
    u = User.new(register_params)
    if u.save
      @user = User.find_by(:email => register_params[:email])
      session[:user_id] = @user.id
      redirect_to "/events"
    else
      #errors
      flash[:errors] = u.errors.full_messages
      redirect_to :back
    end
  end

  def edit
    @user = User.find(params[:id])
  end


  def update
    @user = User.find(params[:id])
    if @user.update(update_params)
      redirect_to "/events"
    else
      flash[:errors] = @user.errors.full_messages
      redirect_to :back
    end
  end








  def destroy
    @user = User.find(params[:id]).destroy
    session[:user_id] = nil
    redirect_to '/'
  end

















  private
  # Never trust parameters from the scary internet, only allow the white list through.
  def register_params
    params.require(:register).permit(:first_name, :last_name, :email, :city, :state, :password, :confirm_password)
  end
  def login_params
    params.require(:login).permit(:email, :password)
  end
  def update_params
    params.require(:update).permit(:first_name, :last_name, :email, :city, :state)
  end


end
