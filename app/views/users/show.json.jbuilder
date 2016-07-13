json.extract! @user, :id, :name, :email, :password, :admin, :created_at, :updated_at
json.appointment @user.appointment, :user_id, :timeslot_id, :time, :date, :reason_for_visit
