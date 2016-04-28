class StaffController < ApplicationController
	
  def record_info
    @staff_member = DemoStaffMember.find_by(name: params[:staff_member_name])
    today = Date.today
    @start_of_week_front = today.at_beginning_of_week.strftime("%d-%m-%Y")
    @current_values = []
    current_attendance_record = AttendanceRecord.where(demo_staff_member: DemoStaffMember.find_by(name: params[:staff_member_name]),
							  start_of_week: today.at_beginning_of_week)[0]

    if !current_attendance_record.nil?
      @current_values << [current_attendance_record.monday_store, current_attendance_record.monday_store.id]
      @current_values << [current_attendance_record.tuesday_store, current_attendance_record.tuesday_store.id]
      @current_values << [current_attendance_record.wednesday_store, current_attendance_record.wednesday_store.id]
      @current_values << [current_attendance_record.thursday_store, current_attendance_record.thursday_store.id]
      @current_values << [current_attendance_record.friday_store, current_attendance_record.friday_store.id]
      @current_values << [current_attendance_record.saturday_store, current_attendance_record.saturday_store.id]
      @current_values << [current_attendance_record.sunday_store, current_attendance_record.sunday_store.id]
    else
      for i in 0..6
        @current_values << ["Registro pendiente", Store.find_by(name: "Registro pendiente").id]
      end
    end

    stores = Store.all
    @formatted_store_array = []

    stores.each do |current_store|
      @formatted_store_array << [current_store.name, current_store.id]
    end

    def post_or_update_attendance_records
      today = Date.today
      start_of_week = today.at_beginning_of_week.strftime("%d-%m-%Y %H:%M:%S")
      previous_record = AttendanceRecord.where(demo_staff_member: DemoStaffMember.where(params[:staff_member]), start_of_week: today.at_beginning_of_week)[0]
      if !previous_record.nil?
        previous_record.destroy
      end
      AttendanceRecord.find_or_create_by(demo_staff_member: DemoStaffMember.find(params[:staff_member]),
					 start_of_week: start_of_week,
                                         monday_store: Store.find_by(id: params[:monday]),
					 tuesday_store: Store.find_by(id: params[:tuesday]),
					 wednesday_store: Store.find_by(id: params[:wednesday]),
					 thursday_store: Store.find_by(id: params[:thursday]),
					 friday_store: Store.find_by(id: params[:friday]),
					 saturday_store: Store.find_by(id: params[:saturday]),
					 sunday_store: Store.find_by(id: params[:sunday]))
      redirect_to(success_path) and return
    end
  end

  def results
    @results = DemoStaffMember.where('name LIKE ?', "%#{params[:search_term]}%")
  end

  def search
  end

end
