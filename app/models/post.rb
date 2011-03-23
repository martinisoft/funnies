class Post < ActiveRecord::Base
  belongs_to :user

  validates :body, presence: true
  validates :title, presence: true
  validates :user_id, presence: true
end
