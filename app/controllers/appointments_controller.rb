class AppointmentsController < ApplicationController
  before_action :get_id, only: [:update, :destroy]
  before_action :appointment_params, only: [:update, :create]

   def index
      @appointments = User.appointments.all
         render :index
      # else
      #    redirect_to home_index_path
   end

   def new
     @appointments = Appointment.new
     @user = User.find_by_id(params[:id])
   end

   def show
     @user = User.find_by_id(params[:id])
     @appointment = Appointment.find_by_id(params[:id])
     render :show
   end

   def create
      #  req_date
      @appointment = Appointment.new(appointment_params)
      req_date=Date.strptime(appointment_params[:date], "%m/%d/%Y")
      @appointment.date = req_date
      @appointment.user = current_user
      @appointment.save
      send_email(current_user.email)
      redirect_to user_path(current_user)
   end

   def edit
     @appointment = Appointment.find_by_id(params[:id])
     render :edit
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

   def get_id
    appointment_id = params[:id]
    Appointment.find_by_id(appointment_id)
    timeslot_id = params[:id]
    Timeslot.find_by_slug(timeslot_id)

   end


   def appointment_params
      params.require(:appointment).permit(:date, :email, :reason_for_visit)
   end
end
