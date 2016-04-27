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
    "#{self.demo_staff_member.name} (#{self.start_of_week})"
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
	strftime_format do
	  '%d-%m-%Y %H:%M:%S'
	end
      end
      field :monday_store do
      	required true
        help "Por favor llena este campo."
  	  end
      field :tuesday_store do
      	required true
        help "Por favor llena este campo."
  	  end
      field :wednesday_store do
      	required true
        help "Por favor llena este campo."
  	  end
      field :thursday_store do
      	required true
        help "Por favor llena este campo."
  	  end
      field :friday_store do
      	required true
        help "Por favor llena este campo."
  	  end
      field :saturday_store do
      	required true
        help "Por favor llena este campo."
  	  end
      field :sunday_store do
      	required true
        help "Por favor llena este campo."
  	  end
  	end
  end
end
