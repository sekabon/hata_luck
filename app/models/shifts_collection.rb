# ユーザーのコレクションモデル
class ShiftsCollection
  include ActiveModel::Conversion
  extend ActiveModel::Naming
  extend ActiveModel::Translation
  include ActiveModel::AttributeMethods
  include ActiveModel::Validations
  SHIFT_NUM = 7 # 同時にユーザーを作成する数
  attr_accessor :collection

  # 初期化メソッド
  def initialize(attributes = [])
    self.collection = if attributes.present?
                        attributes.map do |value|
                          Shift.new(
                            work_day: value['work_day'],
                            start_time: value['start_time'],
                            end_time: value['end_time'],
                            break_start: value['break_start'],
                            break_end: value['break_end']
                          )
                        end
                      else
                        SHIFT_NUM.times.map { Shift.new }
                      end
  end

  # レコードが存在するか確認するメソッド
  def persisted?
    false
  end

  # コレクションをDBに保存するメソッド
  def save
    is_success = true
    ActiveRecord::Base.transaction do
      collection.each do |result|
        # バリデーションを全てかけたいからsave!ではなくsaveを使用
        is_success = false unless result.save
      end
      # バリデーションエラーがあった時は例外を発生させてロールバックさせる
      raise ActiveRecord::RecordInvalid unless is_success
    end
  rescue StandardError
    p 'エラー'
  ensure
    return is_success
  end
end
