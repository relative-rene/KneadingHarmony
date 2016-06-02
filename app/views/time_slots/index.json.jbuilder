json.array!(@time_slots) do |time_slot|
  json.extract! time_slot, :id, :name, :start_time
  json.url time_slot_url(time_slot, format: :json)
end
