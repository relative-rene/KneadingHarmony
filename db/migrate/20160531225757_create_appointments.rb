class CreateAppointments < ActiveRecord::Migration
    def change
        create_table :appointments do |t|
            t.integer :user_id
            t.integer :timeslot_id
            t.string :date
            t.string :start
            t.string :duration
            t.string :reason_for_visit

            t.timestamps null: false
        end
    end
end
