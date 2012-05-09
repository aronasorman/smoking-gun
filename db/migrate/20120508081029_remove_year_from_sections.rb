class RemoveYearFromSections < ActiveRecord::Migration
  def up
  	remove_column :sections, :year
  end

  def down
  end
end
