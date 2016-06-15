class AppointmentsController < ApplicationController
   def index
      @appointments = User.appointments
      current_user
         render :index
      # else
      #    redirect_to home_index_path
   end

   def send_email(email)
      if email.nil?
         flash[:error] = "No email"
         return
      end
      AppointmentMailer.appointment_created(email).deliver_now
      flash[:success] = "Appointment created!"
   end

   def create
      #  req_date
      appointment = Appointment.create(appointment_params)
      req_date=Date.strptime(appointment_params[:date], "%m/%d/%Y")
      appointment.date = req_date
      appointment.user = current_user
      appointment.save
      send_email(current_user.email)
      test_service = MyServices::PhotonService.new()
      test_service.test_fire("on")
      redirect_to user_path(current_user)
   end

   def destroy
      @appointment = appointment.find(params[:id])
      @user = @appointment.user
      if current_user == @user
         @user.appointments.destroy(@appointment)
         flash[:success] = "Appointment Canceled!"
         redirect_to @user
      else
         flash[:error] = "Must log in to Cancel the Appointment"
         redirect_to home_path
      end
   end

   def availability
      req_date=Date.strptime(params[:date], "%m/%d/%Y")
      week_day=req_date.wday
      time_check=Appointment.all.where(date:req_date).pluck(:time)
      work_hour_check=WorkHour.where(week_day:week_day).where.not(hour: [time_check]).pluck(:hour)
      render json:work_hour_check
      return
   end


   private

   def appointment_params
      params.permit(:date, :email, :time)
   end
end
