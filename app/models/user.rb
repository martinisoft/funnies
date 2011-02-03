class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :comics, :through => :subscriptions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :token_authenticateable, :confirmable, :lockable

  attr_accessor :login
  attr_accessible :username, :email, :login,
                  :password, :password_confirmation, :remember_me

  validates :username, :presence => true

  def subscribed?(comic)
    comics.include?(comic)
  end

  def subscribe!(comic)
    comics << comic unless subscribed?(comic)
  end

  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where(["username = :value OR email = :value",
                             { :value => login }]).first
  end
end
