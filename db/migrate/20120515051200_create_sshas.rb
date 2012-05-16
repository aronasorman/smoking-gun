class CreateSshas < ActiveRecord::Migration
  def change
    create_table :sshas do |t|
      t.integer :student_id
      t.integer :DA
      t.integer :WM
      t.integer :TA
      t.integer :EA

      t.timestamps
    end
  end
end
