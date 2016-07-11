json.array!(@timeslots) do |timeslot|
  json.extract! timeslot, :id, :week_day, :hour, :admin
  json.url timeslot_url(timeslot, format: :json)
end
