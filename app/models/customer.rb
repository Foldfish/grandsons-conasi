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
    end

  	edit do
  	  field :name do
  	  	required true
        help "Por favor llena este campo."
  	  end
  	end
  end
end
