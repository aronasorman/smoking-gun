class AddReligionToStudents < ActiveRecord::Migration
  def change
    add_column :students, :religion, :string
  end
end
