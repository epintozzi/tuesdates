class SessionsController < ApplicationController
  def create
    @user = User.from_omniauth(request.env['omniauth.auth'])
    if @user
      session[:user_id] = @user.id
      flash[:success] = "Welcome, #{@user.first_name}"
      redirect_to root_path
    else
      flash[:warning] = "There was an error while trying to authenticate your account. Please try again."
      render :new
    end
  end

  def destroy
    if current_user
      session.delete(:user_id)
      flash[:success] = "You have successfully logged out"
    end
    redirect_to root_path
  end
end
