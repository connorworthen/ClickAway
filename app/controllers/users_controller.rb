class UsersController < ApplicationController
  # before_action :require_log_in, only: [:new, :create, :edit, :update]

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
    @user = User.find(current_user.id)
  end

  def update
    @user = User.find(params[:id])  
    @user.update(user_params)
    if @user.save
      redirect_to '/'
    else
      render :edit
    end 
  end

  # def update
  #   @user = User.find(params[:id])
  #   if
  #     @user.toggle(:manufacturer).save
  #     redirect_to '/'
  #   else
  #     redirect_to '/'
  #   end
  # end

# delete accounts/ toggle! ? / if params1 no change then else or empty or nil

  private

    def user_params
        params.require(:user).permit(:name, :password)
    end
    
    def user_helper
      @user = User.find_by(params[:id])
    end

end