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

  # def update
  #   @user = User.find(params[:id])
  #   if params[:commit] == "A" 
  #     current_user.update(user_params)
  #     @user.save
  #     redirect_to '/'
  #   else params[:commit] == "B"
  #     @user.update_attribute(:manufacturer, true)
  #     redirect_to '/'
  #   end
  # end

  def update
    @user = User.find(params[:id])
    if update_key?
      current_user.update(user_params)
      redirect_to '/'
    else update_attribute?
      @user.update_attribute(:manufacturer, true)
      redirect_to '/'
    end
  end

      
  private

    def user_params
        params.require(:user).permit(:name, :password)
    end
    
    def user_helper
      @user = User.find_by(params[:id])
    end

    def update_attribute?
      params[:commit] == "B"
    end

    def update_key?
      params[:commit] == "A"
    end
end