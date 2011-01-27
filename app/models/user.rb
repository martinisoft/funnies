class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  attr_accessor :login
  attr_accessible :username, :email, :login, 
                  :password, :password_confirmation, :remember_me

  validates :username, :presence => true
end
