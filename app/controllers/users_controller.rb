class UsersController < ApplicationController
  before_action :authenticate_user, only: [:show]


  def new
    @user = User.new
  end

  def create
  user_params = params.require(:user).permit([:first_name,:last_name,:email,:password,:password_confirmation])
  @user = User.new user_params
  if @user.save
    session[:user_id] = @user.id
    redirect_to root_path, notice: "Thank you for Signning up"
  else
    render :new
  end
  end

  def show
    @user = current_user
  end

end
