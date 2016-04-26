class User < ActiveRecord::Base
  rolify
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  def user_label_method
    "#{self.email}"
  end

  rails_admin do
    object_label_method do
      :user_label_method
    end

  	list do
  	  field :email
  	  field :roles
  	  field :sign_in_count do
        column_width 80
      end
  	  field :current_sign_in_at
  	  field :last_sign_in_at
  	  field :current_sign_in_ip
  	  field :last_sign_in_ip
      field :reset_password_sent_at
  	end

  	edit do
  	  field :email do
  	  	required true
        help "Por favor llena este campo."
  	  end
      field :password
  	  field :roles do
  	  	required true
        help "Por favor llena este campo."
  	  end
  	end
  end
end
