class ChangeStoreColumnsInAttendanceRecords < ActiveRecord::Migration
  def change
  	rename_column :attendance_records, :monday_store, :monday_store_id
  	rename_column :attendance_records, :tuesday_store, :tuesday_store_id
  	rename_column :attendance_records, :wednesday_store, :wednesday_store_id
  	rename_column :attendance_records, :thursday_store, :thursday_store_id
  	rename_column :attendance_records, :friday_store, :friday_store_id
  	rename_column :attendance_records, :saturday_store, :saturday_store_id
  	rename_column :attendance_records, :sunday_store, :sunday_store_id
  end
end
