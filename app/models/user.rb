class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable,
  # :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :email, :password, :password_confirmation, :remember_me, :username, :enabled, :profile
  
  validates :profile, :length => { :maximum => 1000 }
  validates :username, :uniqueness => true
  
  def email_with_username
    "#{username} <#{email}>"
  end

end
