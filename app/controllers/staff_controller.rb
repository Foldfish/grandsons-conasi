class StaffController < ApplicationController
	
  def record_info
    @staff_members = DemoStaffMember.where('name LIKE ?', "%#{params[:search_term]}%").order(:name)
    
    today = Date.today
    @start_of_week_front = today.at_beginning_of_week.strftime("%d-%m-%Y")

    stores = Store.all
    @formatted_store_array = []

    stores.each do |current_store|
      @formatted_store_array << [current_store.name, current_store.id]
    end

    @all_attendance_values = Hash.new

    results.each do |current_result|
      current_result_attendance_values = []
      current_attendance_record = AttendanceRecord.where(demo_staff_member: current_result,
  							  start_of_week: today.at_beginning_of_week)[0]

      if !current_attendance_record.nil?
        current_result_attendance_values << [current_attendance_record.monday_store, current_attendance_record.monday_store.id]
        current_result_attendance_values << [current_attendance_record.tuesday_store, current_attendance_record.tuesday_store.id]
        current_result_attendance_values << [current_attendance_record.wednesday_store, current_attendance_record.wednesday_store.id]
        current_result_attendance_values << [current_attendance_record.thursday_store, current_attendance_record.thursday_store.id]
        current_result_attendance_values << [current_attendance_record.friday_store, current_attendance_record.friday_store.id]
        current_result_attendance_values << [current_attendance_record.saturday_store, current_attendance_record.saturday_store.id]
        current_result_attendance_values << [current_attendance_record.sunday_store, current_attendance_record.sunday_store.id]
      else
        for i in 0..6
          current_result_attendance_values << ["Pendiente", Store.find_by(name: "Pendiente").id]
        end
      end

      @all_attendance_values[current_result.id] = current_result_attendance_values
    end

    def post_or_update_attendance_records
      today = Date.today
      start_of_week = today.at_beginning_of_week.strftime("%d-%m-%Y %H:%M:%S")
      if !params["current_staff_member_ids"].nil?
        params["current_staff_member_ids"].each do |current_staff_member|
          previous_record = AttendanceRecord.where(demo_staff_member_id: current_staff_member, start_of_week: today.at_beginning_of_week)[0]
          if !previous_record.nil?
            previous_record.destroy
          end
          AttendanceRecord.find_or_create_by(demo_staff_member_id: current_staff_member,
                                             start_of_week: start_of_week,
                                             monday_store: Store.find_by(id: params["monday" + current_staff_member]),
    					                               tuesday_store: Store.find_by(id: params["tuesday" + current_staff_member]),
    					                               wednesday_store: Store.find_by(id: params["wednesday" + current_staff_member]),
    					                               thursday_store: Store.find_by(id: params["thursday" + current_staff_member]),
    					                               friday_store: Store.find_by(id: params["friday" + current_staff_member]),
    					                               saturday_store: Store.find_by(id: params["saturday" + current_staff_member]),
    					                               sunday_store: Store.find_by(id: params["sunday" + current_staff_member]))
        end
        redirect_to record_info_path(:search_term => params[:search_term], :saved => true) and return
      else
        redirect_to record_info_path(:search_term => params[:search_term], :notice => "empty_params") and return
      end
    end
  end

  def results
    @results = DemoStaffMember.where('name LIKE ?', "%#{params[:search_term]}%")
  end

  def search
  end

  def success
  end

end
