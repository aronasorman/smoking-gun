class AddInterviewIdToFollowupInterviews < ActiveRecord::Migration
  def change
    add_column :followup_interviews, :interview_id, :integer
  end
end
