json.array!(@attendance_records) do |attendance_record|
  json.extract! attendance_record, :id, :demo_staff_member_id, :start_of_week, :monday_store, :tuesday_store, :wednesday_store, :thursday_store, :friday__store, :saturday_store, :sunday_store
  json.url attendance_record_url(attendance_record, format: :json)
end
