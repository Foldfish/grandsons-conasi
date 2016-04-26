class Chain < ActiveRecord::Base
  has_many :stores, :dependent => :destroy, :inverse_of => :chain

  
  def chain_label_method
    "#{self.name}"
  end

  rails_admin do
    object_label_method do
      :chain_label_method
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
