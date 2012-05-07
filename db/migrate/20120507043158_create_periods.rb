class CreatePeriods < ActiveRecord::Migration
  def change
    create_table :periods do |t|
      t.integer :num
      t.date :date

      t.timestamps
    end
  end
end
