class CreateRoutineInterviews < ActiveRecord::Migration
  def change
    create_table :routine_interviews do |t|
      t.text :general_mental_ability
      t.text :academic_history
      t.integer :interview_id
      t.text :family_relationship
      t.text :personal_emotional
      t.text :peer_relationship
      t.text :goals
      t.text :recommendation

      t.timestamps
    end
  end
end
