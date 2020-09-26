class Shift < ApplicationRecord
  belongs_to :user, optional: true

  validates :start_time, presence: true
end
