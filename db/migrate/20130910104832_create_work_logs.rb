class CreateWorkLogs < ActiveRecord::Migration
  def change
    create_table :work_logs do |t|
      t.belongs_to :task, index: true
      t.date :start_date
      t.time :start_time
      t.date :end_date
      t.time :end_time
      t.decimal :hours

      t.timestamps
    end
  end
end
