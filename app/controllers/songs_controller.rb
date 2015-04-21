class SongsController < ApplicationController

  def index
    session[:hits] ||= 0
    session[:hits] += 1
    @songs = current_user.songs.all
  end

  def show
    @song = current_user.songs.find(params[:id])
  end

  def new
    @song = current_user.songs.new
  end

  def create
    @song = current_user.songs.new(song_params)
    if @song.save
      redirect_to user_path(current_user)
    else
      flash[:errors] = @song.errors.full_messages.join(', ')
      render :new
    end
  end

  def edit
    @song = current_user.songs.find(params[:id])
  end

  def update
    @song = current_user.songs.find(params[:id])
    if @song.update(song_params)
      redirect_to user_path(current_user)
    else
      flash[:errors] = @song.errors.full_messages.join(', ')
      render :edit
    end
  end

  def destroy
    @song = current_user.songs.find(params[:id])
    @song.destroy
    redirect_to user_path(current_user)
  end

  def all
    current_user.songs.each do |song|
      song.destroy
    end
    flash[:notice] = "All crappy music is gone"
    redirect_to user_path(current_user)
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist)
  end

end