class CreateScheduleEntries < ActiveRecord::Migration
  def change
    create_table :schedule_entries do |t|

      t.timestamps
    end
  end
end
