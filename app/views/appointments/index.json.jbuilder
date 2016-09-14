json.array!(@appointments) do |appointment|
    json.extract! appointment, :id, :date, :start, :duration, :reason_for_visit, :user_id, :timeslot_id
    json.url appointment_url(appointment, format: :json)
end
