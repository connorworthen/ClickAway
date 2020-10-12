class UsersController < ApplicationController

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

  def approve
    user_helper
    @user.update_attribute(:manufacturer, 'true')
    @user.update_attribute(:updated_at, Time.now)
    redirect_to '/'
  end

  
  def show
    user_helper
  end 

  def edit
    user_helper
  end

  def update
      user_helper
      @user.update(user_params)
      if @user.save
        redirect_to users_path(@user)
      else 
        render :edit 
      end 
    end
      
  private

    def user_params
        params.require(:user).permit(:name, :password)
    end
    
    def user_helper
      @user = User.find_by(params[:id])
    end
end