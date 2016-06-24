class SessionsController < ApplicationController

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.confirm(user_params)
    if @user
      flash[:notice] = "Welcome back #{@user.first_name}"
      login(@user)
      redirect_to "/users/#{@user.id}"
    else
      flash[:error] = "The e-mail or password you entered is incorrect. Please try again"
      redirect_to signin_path
    end
  end

  def delete
    logout
    redirect_to homepage_path
  end

  private

  def user_params
    params.require(:user).permit(:email, :password)
  end


end
