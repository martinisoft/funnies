class User < ActiveRecord::Base
  has_many :subscriptions
  has_many :comics, :through => :subscriptions
  has_many :posts
  has_many :suggestions

  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable,
         :confirmable, :lockable

  attr_accessor :login
  attr_accessible :username, :email, :login,
                  :password, :password_confirmation, :remember_me

  validates :username, :email, presence: true, uniqueness: true

  def subscribed?(comic)
    comics.include?(comic)
  end

  def subscribe!(comic)
    comics << comic unless subscribed?(comic)
  end

  def unsubscribe!(comic)
    subscriptions.find_by_comic_id(comic).destroy unless !subscribed?(comic)
  end

  def to_param
    username.parameterize
  end

  protected

  def self.find_for_database_authentication(conditions)
    login = conditions.delete(:login)
    where(conditions).where([
      "LOWER(username) = :value OR LOWER(email) = :value",
      { value: login }]).first
  end
end
