class AppointmentsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]

  def index
    @appointment = Appointment.all
    @user = User.find_by_id(params[:id])
    render :index
  end

  def show
    @appointment = Appointment.find_by_slug(params[:user_id])
    render :show
  end

  def new
    @appointment = Appointment.new
    @user = User.find_by_id(params[:id])
  end

  def create
    Time.zone = appointment_params[:time_zone]
    @appointment.user_id = current_user.id
    @appointment = @user.appointments.create(appointment_params).valid?
    @user = User.find_by_id(params[:id])

    respond_to do |format|
      if @appointment.save
        flash[:notice] = "Your appointment has been confirmed"
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
        redirect_to root_path
      else
        flash[:error] = "Please review form and fill in all fields marked with an *"
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to user_path(@user)
  end


  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day, :slug).merge(user_id: current_user.id)
  end

end
