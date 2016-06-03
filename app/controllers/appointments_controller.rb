class AppointmentsController < ApplicationController
  before_action :logged_in?, only: [:create, :destroy]

  def create
    Time.zone = appointment_params[:time_zone]
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.create(appointment_params).valid?

    respond_to do |format|
      if @appointment.save
        format.html { redirect_to @appointment, notice: 'Appointment was successfully created.' }
        format.json { render :show, status: :created, location: @appointment }
      else
        format.html { render :new }
        format.json { render json: @appointment.errors, status: :unprocessable_entity }
      end
    end
    redirect_to user_path(@user)
  end

  def destroy
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.find(params[:id])
    @appointment.destroy
    redirect_to user_path(@user)
  end


  private

  def appointment_params
    params.require(:appointment).permit(:time_slot_id, :day).merge(user_id: current_user.id)
  end

end
