class SongsController < ApplicationController

  before_filter :authenticate, only: [:edit, :destroy]

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
    redirect_to song_path(@song)
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