class CreateDats < ActiveRecord::Migration
  def change
    create_table :dats do |t|
      t.integer :student_id
      t.integer :verbal
      t.integer :numerical
      t.integer :abstract
      t.integer :mechanical
      t.integer :spacer_relation
      t.integer :spelling
      t.integer :language

      t.timestamps
    end
  end
end
