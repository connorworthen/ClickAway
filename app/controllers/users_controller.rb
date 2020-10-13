class UsersController < ApplicationController
  before_action :require_log_in, only: [:new, :create, :edit, :update]
  before_action :true_false, only: [:edit]

  def new
    @user = User.new
  end 

  def create
    @user = User.create(user_params)
    if @user.save
      session[:user_id] = @user.id
      redirect_to '/'
    else
      render :new
    end
  end 

  def show
    user_helper
  end 

  def edit
    user_helper
  end

  def update
   
  end
      
  private

    def user_params
        params.require(:user).permit(:name, :password)
    end
    
    def user_helper
      @user = User.find_by(params[:id])
    end
end