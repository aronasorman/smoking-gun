class CreateFollowupInterviews < ActiveRecord::Migration
  def change
    create_table :followup_interviews do |t|
      t.string :comments
      t.string :planned_intervention

      t.timestamps
    end
  end
end
