class AppointmentsController < ApplicationController
  before_action :get_id, only: [:update, :destroy]
  before_action :appointment_params, only: [:update, :create]

   def index
      @appointment = User.appointments.all
         render :index
   end

   def new
     @appointment = Appointment.new
     @user = User.find_by_id(params[:id])
     @timeslot = User.find_by_id(params[:id])
   end

   def show
     @user = User.find_by_id(params[:id])
     @appointment = @user.appointment
     render :show
   end

   def create
      @appointment = Appointment.new(appointment_params)
      @appointment.date = Date.strptime(appointment_params[:date], "%m/%d/%Y")
      @timeslot = Timeslot.find_by_slug(params[:id])
      @timeslot.appointments << @appointment
      @user.appointments << @appointment
      @user.save
      @appointment.save
      @timeslot.save

      send_email(@appointment.user.email)
      redirect_to user_path(@appointment.user)
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
