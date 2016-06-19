class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.string "week_day"
      t.string "hour"

      t.timestamps null: false
    end
  end
end
