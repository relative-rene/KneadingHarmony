json.extract! @timeslot, :id, :week_day, :hour, :created_at, :updated_at
#json.new_url new_timeslot_url if current_user.admin == 7531
#the commented out code was a failed attempt to prevent non admin from creating new timeslots
