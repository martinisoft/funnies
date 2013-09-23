class Post < ActiveRecord::Base

  belongs_to :user

  validates :body, presence: true
  validates :title, presence: true

  default_scope -> { order('created_at DESC') }
end
