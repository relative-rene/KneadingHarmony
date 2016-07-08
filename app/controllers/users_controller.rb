class UsersController < ApplicationController
  def index
    @user = User.find_by_id(params[:id])
    render :index
  end

  def new
    @user = User.new
    render :new
  end

  def create
    @user = User.create(user_params)
    if @user.save
    flash[:notice] = "Welcome to Kneading Harmony! Your profile has been successfully created!"
    login(@user)
    redirect_to user_path(@user)
    else
    flash[:error] = "Please fill in all required fields (marked with *)"
    redirect_to new_user_path
    end
  end

  def show
    user_id = User.find_by_id(params[:id])
    @appointment = Appointment.all
    @user = @appointment.where(id:user_id)
    if @user == current_user
    render :show
    else
      redirect_to users_path
    end
  end

  def edit
    @user = User.find_by_id(params[:id])
    if current_user == @user
      render :edit
    else
      redirect_to users_path
    end
  end

  def update
    @user = User.find_by_id(params[:id])
    if current_user == @user
      if @user.update(user_params)
        flash[:notice] = "Successfully Updated!"
        redirect_to @user
      else
        flash[:error] = "Please fill in all required fields (marked with *)"
        redirect_to @user
      end
    end
  end

  def destroy
    @user = User.find_by_id(params[:id])
    @user.destroy
    flash[:error] = "Your profile has been deleted"
    redirect_to root_path
  end

  private

  def user_params
    params.require(:user).permit(:name, :email, :admin, :password, :phone_number,  :password_confirmation)
  end
end
