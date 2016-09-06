json.extract! @timeslot, :id, :monday,:tuesday,:wednesday,:thursday,:friday,:saturday, :sunday, :am,:pm,:time, :created_at, :updated_at
#json.new_url new_timeslot_url if current_user.admin == 7531
#the commented out code was a failed attempt to prevent non admin from creating new timeslots
