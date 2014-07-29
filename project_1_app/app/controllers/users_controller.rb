class UsersController < ApplicationController

  before_filter :authenticate, only: [:edit, :destroy]

    # @q = User.search(params[:q])
    # @user = @q.result

  def index
    @users = User.all
  end

  def show  
    @user = User.find(params[:id])
    # To be able to access the comments, I had to initiate the instance variable here.
    @song = Song.find(params[:id])   
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to(user) # Consider redirecting to a different route.
    else
      render 'new'
    end
  end

  def edit
    @user = User.find(params[:id])
  end

  def update
    # Check if it needs to be an instance variable here. Left as local variable because the scope might not matter.
    user = User.find(params[:id])
    user.update_attributes(params[:user])
    redirect_to(user) # Find out more if you can. You can also have if statement that returns a successful message.
  end

  def destroy
    #Another local variable here.
    user = User.find(params[:id])
    user.delete
    redirect_to(users_path)
  end

  # In the console, I can only find the entry using the user_id. 

end
