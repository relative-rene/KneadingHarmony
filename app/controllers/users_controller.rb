class UsersController < ApplicationController
  def index
    @users = User.all
  end

  def show
    @user= User.find(params[:id])
  end

  def new
  end

  def create
    @user = User.new(params.require(:user).permit(:first_name, :last_name, :password_digest, :phone_number, :email)

    @user.save
    redirect_to @user
  end
end
