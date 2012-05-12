class CreateGuardians < ActiveRecord::Migration
  def change
    create_table :guardians do |t|
      t.string :name
      t.string :type
      t.integer :age
      t.string :occupation
      t.string :work_address
      t.string :telno
      t.string :celno
      t.string :email
      t.string :religion
      t.integer :student_id

      t.timestamps
    end
  end
end
