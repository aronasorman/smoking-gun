class CreateHspqs < ActiveRecord::Migration
  def change
    create_table :hspqs do |t|
      t.integer :student_id
      t.integer :A
      t.integer :B
      t.integer :C
      t.integer :D
      t.integer :E
      t.integer :G
      t.integer :Q2
      t.integer :Q3
      t.integer :Q4

      t.timestamps
    end
  end
end
