class UsersController < ApplicationController
  before_action :require_log_in, only: [:new, :create, :edit, :update]
  before_action :current_user

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
    if @user.manufacturer = true
      redirect_to '/'
    else
      manufacturer_user_path(@user)
    end
  end

  def update
    if options[:no_capybara]
      user_helper
      remember_token = User.new_remember_token
      cookies[:remember_token] = remember_token
      user.update_attribute(:remember_token, User.digest(remember_token))
    else
      fill_in "Email", with: user.email
      fill_in "Password", with: user.password
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