require 'date'

private def date_valid?(str)
  !!Date.parse(str)
        rescue StandardError
          false
end

class Shift < ApplicationRecord
  belongs_to :user
  validates :work_day, timeliness: { on_or_after: Time.now.since(2.weeks).monday }

  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_is_after_start_time

  def end_time_is_after_start_time
    return if end_time.blank? || start_time.blank?

    errors.add(:end_time, 'は出勤時間より前にしてください') if end_time < start_time
  end
end
