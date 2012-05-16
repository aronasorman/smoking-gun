class ChangeCommentsColumnToTextInFollowupInterviews < ActiveRecord::Migration
  def up
	change_column :followup_interviews, :comments, :text
  end

  def down
  end
end
