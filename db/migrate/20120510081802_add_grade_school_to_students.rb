class AddGradeSchoolToStudents < ActiveRecord::Migration
  def change
    add_column :students, :grade_school, :string
  end
end
