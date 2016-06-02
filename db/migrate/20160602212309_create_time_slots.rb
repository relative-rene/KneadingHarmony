class CreateTimeSlots < ActiveRecord::Migration
  def change
    create_table :time_slots do |t|
      t.string :name
      t.datetime :start_time

      t.timestamps null: false
    end
  end
end
