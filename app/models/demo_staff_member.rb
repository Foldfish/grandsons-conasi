# == Schema Information
#
# Table name: demo_staff_members
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  RFC        :string
#  CURP       :string
#  NSS        :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class DemoStaffMember < ActiveRecord::Base
  has_many :attendance_records, :dependent => :destroy, :inverse_of => :demo_staff_member

  def demo_staff_member_label_method
    "ID: #{self.id}. #{self.name}"
  end

  rails_admin do
    object_label_method do
      :demo_staff_member_label_method
    end

    list do
      field :name
      field :phone
      field :RFC
      field :CURP
      field :NSS
    end

  	edit do
  	  field :name do
  	  	required true
        help "Por favor llena este campo."
  	  end
  	  field :phone do
  	  required true
  	  	help "Por favor llena este campo."
  	  end
  	  field :RFC do
  	  	required true
  	  	help "Por favor llena este campo."
  	  end
  	  field :CURP do
  	  	required true
  	  	help "Por favor llena este campo."
  	  end
  	  field :NSS do
  	  	required true
  	  	help "Por favor llena este campo."
  	  end
  	end
  end
end
