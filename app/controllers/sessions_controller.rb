class SessionsController < ApplicationController
  def new
  end
  def create
  	@user = User.find_by email: params[:session][:email].downcase
  	if @user.present? && @user.authenticate(params[:session][:password])
  		login_user @user
  		flash[:success] = "Login successful"
  		redirect_to @user
  	else
  		flash.now[:danger] = "Email or Password is Incorrect!!"
  		render :new
  	end
  end
  def destroy
    session.delete(:user_id)
    @current_user = nil
    flash[:success] = "Goodbye"
      redirect_to root_path
    
  end
end