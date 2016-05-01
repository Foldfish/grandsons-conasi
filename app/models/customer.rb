# == Schema Information
#
# Table name: customers
#
#  id         :integer          not null, primary key
#  name       :string
#  contact    :string
#  email      :string
#  phone      :string
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Customer < ActiveRecord::Base
  has_and_belongs_to_many :stores
  
  def customer_label_method
    "#{self.name}"
  end

  rails_admin do
    object_label_method do
      :customer_label_method
    end

    list do
      field :name
      field :contact
      field :email
      field :phone
    end

  	edit do
  	  field :name do
  	  	required true
	        help "Por favor llena este campo."
  	  end
  	  field :contact do
  	  	required true
	        help "Por favor llena este campo."
  	  end
  	  field :email do
  	  	required true
	        help "Por favor llena este campo."
  	  end
  	  field :phone do
  	  	required true
	        help "Por favor llena este campo."
  	  end
  	end
  end
end
