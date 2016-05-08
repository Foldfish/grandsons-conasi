# == Schema Information
#
# Table name: attendance_records
#
#  id                   :integer          not null, primary key
#  start_of_week        :date
#  monday_store_id      :integer
#  tuesday_store_id     :integer
#  wednesday_store_id   :integer
#  thursday_store_id    :integer
#  friday_store_id      :integer
#  saturday_store_id    :integer
#  sunday_store_id      :integer
#  demo_staff_member_id :integer
#  created_at           :datetime         not null
#  updated_at           :datetime         not null
#

class AttendanceRecord < ActiveRecord::Base
  belongs_to :demo_staff_member, :inverse_of => :attendance_records
  belongs_to :monday_store,     :class_name => 'Store'
  belongs_to :tuesday_store,    :class_name => 'Store'
  belongs_to :wednesday_store,  :class_name => 'Store'
  belongs_to :thursday_store,   :class_name => 'Store'
  belongs_to :friday_store,     :class_name => 'Store'
  belongs_to :saturday_store,   :class_name => 'Store'
  belongs_to :sunday_store,     :class_name => 'Store'

  def attendance_record_label_method
    if self.demo_staff_member.nil?
      "Attendance Record"
    else
      "#{self.demo_staff_member.name} (#{self.start_of_week.strftime('%d-%m-%Y')})"
    end
  end

  rails_admin do
    object_label_method do
      :attendance_record_label_method
    end

    list do
      field :demo_staff_member do
        column_width 220
      end
      field :start_of_week do
        column_width 80
        strftime_format do
          '%d-%m-%Y'
        end
      end
      field :monday_store do
        column_width 150
      end
      field :tuesday_store do
        column_width 150
      end
      field :wednesday_store do
        column_width 150
      end
      field :thursday_store do
        column_width 150
      end
      field :friday_store do
        column_width 150
      end
      field :saturday_store do
        column_width 150
      end
      field :sunday_store do
        column_width 150
      end
    end

    edit do
      field :demo_staff_member do
        required true
        help "Por favor llena este campo."
      end
      field :start_of_week do
      	default_value do
      	  Date.today.at_beginning_of_week
        end
      	strftime_format do
      	  '%d-%m-%Y'
      	end
      	required true
        help "Por favor llena este campo. Sólo usar fechas que sean día LUNES."
      end
      field :monday_store do
        default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
      field :tuesday_store do
	default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
      field :wednesday_store do
	default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
      field :thursday_store do
	default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
      field :friday_store do
	default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
      field :saturday_store do
	default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
      field :sunday_store do
	default_value do
          1
        end
      	required true
        help "Por favor llena este campo."
      end
    end
  end
end
