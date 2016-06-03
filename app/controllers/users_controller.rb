class UsersController < ApplicationController
  before_action :set_user, only: [:show, :edit, :update, :destroy]

  # GET /users
  # GET /users.json
  def index
    @users = User.all
  end

  # GET /users/1
  # GET /users/1.json
  def show
    @user = User.find_by_id(params[:id])
    if @user == current_user
      render :show
    else
      redirect_to users_path
    end
  end

  # GET /users/new
  def new
    @user = User.new
    render :new
  end

  # GET /users/1/edit
  def edit
    @user = User.find_by_id(params[:id])
    if current_user == @user
      render :edit
    else
      redirect_to services_path
    end
  end
  # POST /users
  # POST /users.json
  def create
    @user = User.create(user_params)

    if @user.save
      flash[:notice] = "Welcome! Your profile has been successfully created!"
      login(@user)
      redirect_to user_path(@user)
    else
      flash[:error] = "Please fill in all required fields (marked with *)"
      redirect_to services_path
    end
  end

  # PATCH/PUT /users/1
  # PATCH/PUT /users/1.json
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
    respond_to do |format|
      if @user.update(user_params)
        format.html { redirect_to @user, notice: 'User was successfully updated.' }
        format.json { render :show, status: :ok, location: @user }
      else
        format.html { render :edit }
        format.json { render json: @user.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /users/1
  # DELETE /users/1.json
  def destroy
    @user.destroy
    respond_to do |format|
      format.html { redirect_to users_url, notice: 'User was successfully destroyed.' }
      format.json { head :no_content }
    end
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_user
      @user = User.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def user_params
      params.require(:user).permit(:name, :email, :login)
    end
end
