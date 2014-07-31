class UsersController < ApplicationController

  before_filter :authenticate, only: [:edit, :destroy]

  # The def home method on the controller page ensures that you can access these variables on the page with the same name. It appears to be the purpose of having the controller layed out in this way.
  def home 

  end

  def index
    @q = User.search(params[:q])
    #@users = @q.result # The variable had to be the plural for this to work.
    # @users = User.all
    @artists = @q.result.select do |artist|
      artist.role == "artist"
    end
  end

  def show  
    @user = User.find(params[:id]) 
  end


  def new
    @user = User.new
  end

  def create
    @user = User.create(params[:user])
    if @user.save
      redirect_to(@user)
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
