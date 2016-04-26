require 'test_helper'

class AttendanceRecordsControllerTest < ActionController::TestCase
  setup do
    @attendance_record = attendance_records(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:attendance_records)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create attendance_record" do
    assert_difference('AttendanceRecord.count') do
      post :create, attendance_record: { demo_staff_member_id: @attendance_record.demo_staff_member_id, friday__store: @attendance_record.friday__store, monday_store: @attendance_record.monday_store, saturday_store: @attendance_record.saturday_store, start_of_week: @attendance_record.start_of_week, sunday_store: @attendance_record.sunday_store, thursday_store: @attendance_record.thursday_store, tuesday_store: @attendance_record.tuesday_store, wednesday_store: @attendance_record.wednesday_store }
    end

    assert_redirected_to attendance_record_path(assigns(:attendance_record))
  end

  test "should show attendance_record" do
    get :show, id: @attendance_record
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @attendance_record
    assert_response :success
  end

  test "should update attendance_record" do
    patch :update, id: @attendance_record, attendance_record: { demo_staff_member_id: @attendance_record.demo_staff_member_id, friday__store: @attendance_record.friday__store, monday_store: @attendance_record.monday_store, saturday_store: @attendance_record.saturday_store, start_of_week: @attendance_record.start_of_week, sunday_store: @attendance_record.sunday_store, thursday_store: @attendance_record.thursday_store, tuesday_store: @attendance_record.tuesday_store, wednesday_store: @attendance_record.wednesday_store }
    assert_redirected_to attendance_record_path(assigns(:attendance_record))
  end

  test "should destroy attendance_record" do
    assert_difference('AttendanceRecord.count', -1) do
      delete :destroy, id: @attendance_record
    end

    assert_redirected_to attendance_records_path
  end
end
