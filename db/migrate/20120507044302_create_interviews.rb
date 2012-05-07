class CreateInterviews < ActiveRecord::Migration
  def change
    create_table :interviews do |t|

      t.timestamps
    end
  end
end
