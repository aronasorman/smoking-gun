class ChangePictureToBinaryStudents < ActiveRecord::Migration
  def up
  	change_column :students, :picture, :binary
  end

  def down
  	change_column :students, :picture, :string
  end
end
