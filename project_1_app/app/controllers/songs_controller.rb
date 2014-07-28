class SongsController < ApplicationController

  def index
    @songs = Song.all
  end

  def show
    @song = Song.find(params[:id])
  end

  def new
    @song = Song.new
  end

  def create
    @song = Song.create(params[:song])
    # Possibly a redirection here.
  end

  def edit
    @song = Song.find(params[:id])
  end

  def update
    song = Song.find(params[:id])
    song.update_attributes(params[:song])
  end

  def destroy
    song = Song.find(params[:id])
    song.delete
  end

end