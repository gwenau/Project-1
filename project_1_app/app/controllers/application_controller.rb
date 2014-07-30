class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :ransack_search_artist
  before_filter :ransack_search_song

  def ransack_search_artist
    @q = User.search(params[:q])
    @users = @q.result
  end

  def ransack_search_song
    @s = Song.search(params[:q])
    @songs = @s.result
  end

  helper_method :current_user

  def current_user
    @current_user ||= User.find(session[:user_id]) if session[:user_id]
  end

  def logged_in?
    !!current_user
  end

  private
  def authenticate
    unless logged_in?
      flash[:error] = "You must be logged in to access this section of the site"
      redirect_to login_url # Interesting syntax here.
    end
  end



end
