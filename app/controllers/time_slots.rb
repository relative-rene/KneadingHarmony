class Time_slotsController < ApplicationController
  def index
    @time_slot = Time_slot.all
    @user = User.find_by_id(params[:id])
    render :index
  end

  def show
    @time_slot = Time_slot.find_by_slug(params[:id])
    @comments = @time_slot.comments
    render :show
  end

  def new
    @time_slot = Time_slot.new
    @user = User.find_by_id(params[:id])
  end

  def create
    @time_slot = Time_slot.new(time_slot_params)
    @time_slot.user_id = current_user.id
    @user = User.find_by_id(params[:id])
    if @time_slot.photo == ""
      @time_slot.photo = "/placeholder.jpg"
    end
    if @time_slot.save
      flash[:notice] = "Let's party! Your time_slot has been successfully created!"
      redirect_to time_slot_path(@time_slot)
    else
      flash[:error] = "Please fill in all required fields (marked with *)"
      redirect_to new_time_slot_path
    end
  end

  def edit
    @time_slot = Time_slot.find_by_slug(params[:id])
    @user = User.find_by_id(params[:id])
    render :edit
  end

  def update
    @time_slot = Time_slot.find_by_slug(params[:id])
    if @time_slot.update(time_slot_params)
      redirect_to time_slot_path(@time_slot)
    else
      flash[:error] = "There was a problem saving your changes"
      redirect_to time_slot_path(@time_slot)
    end
  end

  def destroy
    @time_slot = Time_slot.find_by_slug(params[:id])
    @time_slot.destroy
    redirect_to time_slots_path
  end

  private

  def time_slot_params
    params.require(:time_slot).permit(:title, :location, :time_slot_date, :time_slot_time, :description, :photo, :slug)
  end
end
