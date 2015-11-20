class SessionsController < ApplicationController

  def create
    user = User.find_by_credentials(
      params[:user][:email],
      params[:user][:password])

    if user.nil?
      @user = User.new(email: params[:user][:email])
      flash.now[:errors] = ["Incorrect Email or password."]
      render :new
    else
      login!(user)
      redirect_to bands_url
    end
  end

  def destroy
    logout!
    redirect_to new_session_url
  end

  def new
    @user = User.new
  end

end
