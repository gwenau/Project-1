class CommentsController < ApplicationController

  before_filter :authenticate, only: [:new, :edit, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @song = Song.find(params[:song_id])
    @comment = @song.comments.build
  end

  def create
    @song = Song.find(params[:song_id])
    @comment = @song.comments.build(params[:comment])
   
    @comment.user_id = current_user.id
    @comment.save
      redirect_to song_path(@song)

    # @comment = current_user.comments.create(params[:comment])
    # @comment.user_id = current_user.id
    # @comment.song_id = song.id
    # @comment.save
    # redirect_to song_path(@comment.song.id)
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update 
    comment = Comment.find(params[:id])
    comment.user_id = current_user.id
    comment.save
    comment.update_attributes(params[:comment])
    redirect_to song_path(comment.song.id) 
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to song_path(comment.song)
  end

end