class SessionsController < ApplicationController

  def new
  end

  def create
    user = User.find_by(user_name: params[:session][:user_name])
    if user && user.authenticate(params[:session][:password])
      session[:id] = user.id
      redirect_to user_path(user.id)
    else
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to root_path
  end
end
