class CreateNatureOfProblemTypes < ActiveRecord::Migration
  def change
    create_table :nature_of_problem_types do |t|
      t.string :name

      t.timestamps
    end
  end
end
