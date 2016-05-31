class AppointmentsController < ApplicationController
  def create
    @user = User.find(params[:user_id])
    @appointment = @user.appointments.create(appointment_params)
    redirect_to user_path(@user)
  end




  private
    def appointment_params
      params.require(:appointment).permit(:service, :date)
    end
    
end
