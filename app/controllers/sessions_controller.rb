class SessionsController < ApplicationController
 def new
   
 end

  def create
    user = User.find_by(email: params[:session][:email].downcase)

    if user && user.authenticate(params[:session][:password])
      session[:user_id] = user.id
      #flash[:sucess] = "You have successfully logged in"
      redirect_to articles_path, notice: 'You have successfully logged in'
    else
      #flash.now[:danger] = "Login unsuccessful"
      flash.now.alert = "Unsucessful login. Please try again."
      render 'new'
    end
  end

  def destroy
    session[:chef_id] = nil
    #flash[:success] = "You are logged out"
    flash.notice = 'You are logged out'
    redirect_to root_path
  end
end
