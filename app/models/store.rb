# == Schema Information
#
# Table name: stores
#
#  id         :integer          not null, primary key
#  store_key  :string
#  name       :string
#  address    :string
#  chain_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Store < ActiveRecord::Base
  has_one :supervisor
  has_many :monday_records, :class_name => 'AttendanceRecord', :foreign_key => 'monday_store_id'
  has_many :tuesday_records, :class_name => 'AttendanceRecord', :foreign_key => 'tuesday_store_id'
  has_many :wednesday_records, :class_name => 'AttendanceRecord', :foreign_key => 'wednesday_store_id'
  has_many :thursday_records, :class_name => 'AttendanceRecord',:foreign_key => 'thursday_store_id'
  has_many :friday_records, :class_name => 'AttendanceRecord', :foreign_key => 'friday_store_id'
  has_many :saturday_records, :class_name => 'AttendanceRecord', :foreign_key => 'saturday_store_id'
  has_many :sunday_records, :class_name => 'AttendanceRecord', :foreign_key => 'sunday_store_id'
  belongs_to :chain, :inverse_of => :stores
  has_and_belongs_to_many :customers

  def store_label_method
    "ID: #{self.id}. #{self.name}(#{self.address})"
  end

  rails_admin do
    object_label_method do
      :store_label_method
    end

    list do
      field :store_key
      field :name
      field :address
      field :chain
    end

    edit do
      field :store_key do
     	required true
        help "Por favor llena este campo."
      end
      field :name do
     	required true
        help "Por favor llena este campo."
      end
      field :address
      field :chain do
     	required true
    	help "Por favor llena este campo."
      end
    end
  end
end
