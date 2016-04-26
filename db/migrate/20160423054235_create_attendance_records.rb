class CreateAttendanceRecords < ActiveRecord::Migration
  def change
    create_table :attendance_records do |t|
      t.date :start_of_week
      
      t.belongs_to :monday_store, index: true
      t.belongs_to :tuesday_store, index: true
      t.belongs_to :wednesday_store, index: true
      t.belongs_to :thursday_store, index: true
      t.belongs_to :friday_store, index: true
      t.belongs_to :saturday_store, index: true
      t.belongs_to :sunday_store, index: true
      t.belongs_to :demo_staff_member, index: true

      t.timestamps null: false
    end
  end
end
