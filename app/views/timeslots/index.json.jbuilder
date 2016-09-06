json.array!(@timeslots) do |timeslot|
  json.extract! timeslot, :id, :time, :day, :monday, :tuesday, :wednesday, :thursday, :friday, :saturday, :sunday
  json.url timeslot_url(timeslot, format: :json)
end
