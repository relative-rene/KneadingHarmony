class CreateAppointments < ActiveRecord::Migration
  def change
    create_table :appointments do |t|
      t.references :user, index: true, foreign_key: true
      t.references :timeslot, index: true, foreign_key: true

      t.string :date
      t.integer :reason_for_visit

      t.timestamps null: false
    end
  end
end
