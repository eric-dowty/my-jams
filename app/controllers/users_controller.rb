class UsersController < ApplicationController

  def new
    @user = User.new
  end

  def create
    @user = User.new(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to @user
    else
      flash[:error] = @user.errors.full_messages.join(', ')
      render :new
    end
  end

  def show
    @songs = current_user.songs.all
  end

  private

  def user_params
    params.require(:user).permit(:name, :username, :password, :password_confirmation)
  end

end