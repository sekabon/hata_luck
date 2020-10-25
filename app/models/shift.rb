require 'date'

private def date_valid?(str)
  !!Date.parse(str)
        rescue StandardError
          false
end

class Shift < ApplicationRecord
  belongs_to :user
  validates :work_day, timeliness: { on_or_after: Time.now.since(2.weeks).monday }
  validates :work_day, uniqueness: { scope: :user_id }
  validates :start_time, presence: true
  validates :end_time, presence: true
  validate :end_time_is_after_start_time
  validate :break_end_is_after_break_start
  validate :end_time_is_after_break_end
  validate :break_start_is_after_start_time

  def end_time_is_after_start_time
    return if end_time.blank? || start_time.blank?
    errors.add(:end_time, 'は出勤時間より後にしてください') if  end_time < start_time
  end
  def break_end_is_after_break_start
    return if break_end.blank? || break_start.blank?
    errors.add(:break_end, 'は休憩開始時間より後にしてください') if break_end < break_start
  end
  def end_time_is_after_break_end
    return if end_time.blank? || break_end.blank?
    errors.add(:end_time, 'は休憩終了時間より後にしてください') if end_time < break_end
  end
  def break_start_is_after_start_time
    return if break_start.blank? || start_time.blank?
    errors.add(:break_start, 'は出勤時間より後にしてください') if break_start < start_time
  end
end
