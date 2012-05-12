class AddForeignKeysToScheduleEntries < ActiveRecord::Migration
  def change
    add_column :schedule_entries, :interview_type_id, :integer
    add_column :schedule_entries, :period_id, :integer
    add_column :schedule_entries, :user_id, :integer
    add_column :schedule_entries, :student_id, :integer
  end
end
