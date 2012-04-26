class Suggestion < ActiveRecord::Base
  belongs_to :user

  validates :name, presence: true
  validates :website, presence: true
  validates :reason, presence: true

  attr_accessible :name, :website, :reason

  state_machine initial: :open do
    event :accept do
      transition open: :accepted
    end

    event :reject do
      transition open: :rejected
    end
  end
end
