class UsersController < ApplicationController
  before_action :require_log_in, only: [:new, :create, :edit, :update]

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
    @user = User.find(params[:id])
    if current_user.update(user_params)
      # session[:user_id] = @user.id
      @user.save
      flash[:success] = "Profile updated"
      redirect_to '/'
    else 
      render :edit 
    end
  end

  # def edit2
  #   user_helper
  #   if @user.update_attribute(:manufacturer, true)
  #     flash[:notice] = "This user was approved to be a manufacturer."
  #     redirect_to '/'
  #   else
  #     flash[:error] = "There was an error approving the manufacturer. Please try again."
  #   end
  # end 

      
  private

    def user_params
        params.require(:user).permit(:name, :password)
    end
    
    def user_helper
      @user = User.find_by(params[:id])
    end

    def user_updater
    
    end
end