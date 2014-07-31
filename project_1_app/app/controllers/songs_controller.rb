class SongsController < ApplicationController

  before_filter :authenticate, only: [:new, :edit, :destroy]

  def index

  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(params[:song])
    @song.user_id = current_user.id
    @song.save
    redirect_to(songs_path)
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
   #binding.pry
    song = Song.find(params[:id])
    song.update_attributes(params[:song])
    redirect_to song_path(song)

  end

  def destroy
    song = Song.find(params[:id])
    song.delete
    redirect_to(songs_path)
  end

end