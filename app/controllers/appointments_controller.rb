class AppointmentsController < ApplicationController
    def new
        @appointment = Appointment.new
        @user = User.find_by(params[:user_id])
        render :new
    end

    def edit
        @appointment = Appointment.find_by_id(params[:id])
        render :edit
    end

    def create
        if current_user
            @appointment = Appointment.new(appointment_params)
            @user = User.find_by(params[:user_id])
            if @appointment.save
                @current_user.appointments << @appointment
                @current_user.save
                @appointment.save
                flash[:notice] = 'Your appointment has been booked, please call for lateness or 24 hour cancellations'
                redirect_to @user
            end
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
            flash[:success] = 'Appointment Canceled!'
            redirect_to @user
        else
            flash[:error] = 'Must log in to Cancel the Appointment'
            redirect_to home_path
        end
    end

    def availability
        req_date = Date.strptime(params[:date], '%m/%d/%Y')
        week_day = req_date.wday
        time_check = Appointment.all.where(date: req_date).pluck(:time)
        timeslot_check = Timeslot.where(week_day: week_day).where.not(hour: [time_check]).pluck(:hour)
        render json: timeslot_check
        nil
    end

    def send_email(email)
        if email.nil?
            flash[:error] = 'No email'
            return
        end
        AppointmentMailer.appointment_created(email).deliver_now
        flash[:success] = 'Appointment created!'
    end

    private

    def appointment_params
        params.require(:appointment).permit(:user_id, :timeslot_id, :date, :time, :reason_for_visit)
    end
end
