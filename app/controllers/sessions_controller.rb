class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:session][:email].downcase)
    if user && user.authenticate(params[:session][:password])
      if user.activated?
        log_in user
        params[:session][:remember_me] == '1' ? remember(user) : forget(user)
        redirect_back_or user
      else
        message  = "Account not activated. "
        message += "Check your email for the activation link."
        flash[:warning] = message
        redirect_to root_url
      end
    else
     flash.now[:danger] = 'Invalid email/password combination'
     render 'new'
    end
  end

  def guest_login
    user = User.find_or_create_by(email: 'guest@example.com') do |user|
      user.name = "GuestUser"
      user.password = SecureRandom.urlsafe_base64
    end
    session[:user_id] = user.id
    redirect_to microposts_path
    flash[:notice] = "ゲストユーザーとしてログインしました"
  end

  def destroy
    log_out if logged_in?
    redirect_to root_url
  end
end
