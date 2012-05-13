class CreateOtherInterviews < ActiveRecord::Migration
  def change
    create_table :other_interviews do |t|
      t.text :content
      t.integer :interview_id

      t.timestamps
    end
  end
end
