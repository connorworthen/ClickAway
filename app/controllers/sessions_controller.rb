class SessionsController < ApplicationController

  def login
    if logged_in?
      redirect_to user_path(session[:user_id])
    else 
      render 'login'
    end 
  end 

 def create
    @user = User.find_by(email: params[:email])
    if @user && @user.authenticate(params[:password_digest])
      session[:user_id] = @user.id
      redirect_to user_path(@user)
    else
      redirect_to :root_path, flash[:alert] = "User not found."
    end
  end

  def destroy 
    session.delete :user_id 
    redirect_to root_path
  end

  def omniauth
    @user = User.find_or_create_by(uid: auth[:uid]) do |u|
      u.name= auth[:info][:name]
      u.email= auth[:info][:email]
      u.image = auth[:info][:image]
      u.password = SecureRandom.hex
    end
    
    if @user.valid?
      session[:user_id] = @user.id
      redirect_to users_path(@user)
    end
  end

  private 

    def user_params
      params.require(:user).permit(:email, :password_digest)
    end
    
    def auth
      request.env['omniauth.auth']
    end

end