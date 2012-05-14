class AddNatureOfProblemTypeIdToFollowupInterviews < ActiveRecord::Migration
  def change
    add_column :followup_interviews, :nature_of_problem_type_id, :integer
  end
end
