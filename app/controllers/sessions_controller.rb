class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to cookies[:back_to_page] || tests_path
    else
      flash.now[:alert] = "Are you a Guru? Something's wrong with email/password."
      render :new
    end
  end

  def destroy
    session.clear
    redirect_to tests_path
  end
end
