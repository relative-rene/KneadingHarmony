class TimeslotsController < ApplicationController

  def index
    @timeslot = Timeslot.all
    @user = User.find_by_id(params[:id])
    render :index
  end

  def show
    @timeslot = Timeslot.find_by_id(params[:id])
    render :show
  end

  def new
    @timeslot = Timeslot.new
    render :new
  end

  def create
    @timeslot = Timeslot.new(timeslot_params)
    if @timeslot.save
      flash[:notice] = "You've added another time slot"
      redirect_to timeslot_path(@timeslot)
    else
      flash[:error] = "Please fill in all required fields (marked with *)"
      redirect_to new_timeslot_path
    end
  end

  def edit
    @timeslot = Timeslot.find_by_id(params[:id])
    @user = User.find_by_id(params[:id])
    render :edit
  end

  def update
    @timeslot = Timeslot.find_by_id(params[:id])
    if @timeslot.update(timeslot_params)
      redirect_to timeslot_path(@timeslot)
    else
      flash[:error] = "There was a problem saving your changes"
      redirect_to timeslot_path(@timeslot)
    end
  end

  def destroy
    @timeslot = Timeslot.find_by_id(params[:id])
    @timeslot.destroy
    redirect_to timeslots_path
  end

  private

  def timeslot_params
    params.require(:timeslot).permit(:id, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday, :time)
  end
end
