require 'date'

  private def date_valid?(str)
    !! Date.parse(str) rescue false
  end

class Shift < ApplicationRecord
  belongs_to :user
  validates :work_day, timeliness: { on_or_after: Time.now.since(2.weeks).monday }
  
  validates :start_time, presence: true
  
end
