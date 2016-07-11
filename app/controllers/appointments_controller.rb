class AppointmentsController < ApplicationController

   def new
     @user = User.find_by_id(params[:id])
     @appointment = Appointment.new
     render :new
   end

   def edit
     @appointment = Appointment.find_by_id(params[:id])
     render :edit
   end

   def create
     @appointment = Appointment.new(appointment_params)
     @user = User.find_by_id(params[:id])
     @user.appointments << @appointment
     if @user.save
       flash[:notice] = "We look forward to seeing you"
       redirect_to users_path
     else
       flash[:error] = "Please fill in all fields marked with *"
       redirect_to new_appointment_path
     end
   end

   def update
     get_id.update_attributes(appointment_params)
     redirect_to user_path(user)
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
      req_date = Date.strptime(params[:date], "%m/%d/%Y")
      week_day = req_date.wday
      time_check = Appointment.all.where(date:req_date).pluck(:time)
      timeslot_check = Timeslot.where(week_day: week_day).where.not(hour: [time_check]).pluck(:hour)
      render json:timeslot_check
      return
   end

   def send_email(email)
      if email.nil?
         flash[:error] = "No email"
         return
      end
      AppointmentMailer.appointment_created(email).deliver_now
      flash[:success] = "Appointment created!"
   end

   private

   def appointment_params
     params.require(:appointment).permit(:date, :time, :reason_for_visit)
   end

end
