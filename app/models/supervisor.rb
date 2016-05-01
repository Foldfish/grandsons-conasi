# == Schema Information
#
# Table name: supervisors
#
#  id         :integer          not null, primary key
#  name       :string
#  phone      :string
#  RFC        :string
#  store_id   :integer
#  created_at :datetime         not null
#  updated_at :datetime         not null
#

class Supervisor < ActiveRecord::Base
  belongs_to :store, :inverse_of => :supervisor

  def supervisor_label_method
    "#{self.name}"
  end

  rails_admin do
    object_label_method do
      :supervisor_label_method
    end

    list do
      field :name
      field :phone
      field :RFC
      field :store
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
  	  field :store do
  	  	required true
  	  	help "Por favor llena este campo."
      end
  	end
  end
end
