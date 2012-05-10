class AddCitizenshipToStudents < ActiveRecord::Migration
  def change
    add_column :students, :citizenship, :string
  end
end
