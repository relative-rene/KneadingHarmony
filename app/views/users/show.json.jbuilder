json.extract! @user, :id, :name, :email, :password, :admin, :created_at, :updated_at
json.appointments.extract! @user.appointments, :user_id, :timeslot_id, :date, :start, :duration, :reason_for_visit
