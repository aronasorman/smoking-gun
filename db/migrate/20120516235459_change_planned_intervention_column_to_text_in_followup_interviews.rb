class ChangePlannedInterventionColumnToTextInFollowupInterviews < ActiveRecord::Migration
  def up
	change_column :followup_interviews, :planned_intervention, :text
  end

  def down
  end
end
