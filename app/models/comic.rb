class Comic < ActiveRecord::Base
  has_many :subscriptions
  has_many :readers,  :through => :subscriptions,
                      :source => :user
end
