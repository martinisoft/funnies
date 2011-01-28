class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :confirmable, :lockable and :timeoutable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticateable, :confirmable, :lockable

  attr_accessor :login
  attr_accessible :username, :email, :login,
                  :password, :password_confirmation, :remember_me

  validates :username, :presence => true

  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value",
                             { :value => login }]).first
  end
end
