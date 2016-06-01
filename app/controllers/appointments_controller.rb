class AppointmentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.create(appointment_params).valid?
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
