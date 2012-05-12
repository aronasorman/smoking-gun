class AddForeignKeysToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :interview_type_id, :integer
    add_column :interviews, :period_id, :integer
    add_column :interviews, :user_id, :integer
    add_column :interviews, :student_id, :integer
  end
end
