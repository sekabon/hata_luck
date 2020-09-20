class CreateShifts < ActiveRecord::Migration[6.0]
  def change
    create_table :shifts do |t|
      t.date :work_day,       null: false
      t.time :start_time,     null: false
      t.time :end_time,       null: false
      t.time :break_start
      t.time :break_end
      t.references :user,     null: false, foreign_key: true
      t.timestamps
    end
  end
end
