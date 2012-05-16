class CreateMpcls < ActiveRecord::Migration
  def change
    create_table :mpcls do |t|
      t.integer :student_id
      t.integer :HPD
      t.integer :FLE
      t.integer :SRA
      t.integer :CSM
      t.integer :SPR
      t.integer :PPR
      t.integer :MR
      t.integer :HF
      t.integer :FVE
      t.integer :ASW
      t.integer :CPT

      t.timestamps
    end
  end
end
