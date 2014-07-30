class CommentsController < ApplicationController

  before_filter :authenticate, only: [:create, :edit, :destroy]

  def index
    @comments = Comment.all
  end

  def show
    @comment = Comment.find(params[:id])
  end

  def new
    @comment = Comment.new
  end

  def create
    @comment = Comment.create(params[:comment])
    redirect_to(@comment) # Find out more if you can
  end

  def edit
    @comment = Comment.find(params[:id])
  end

  def update 
    comment = Comment.find(params[:id])
    comment.update_attributes(params[:comment])
    redirect_to song_path(comment.song.id) # Find out more if you can
  end

  def destroy
    comment = Comment.find(params[:id])
    comment.delete
    redirect_to song_path(comment.song)
  end

end