class AddUserIdToSections < ActiveRecord::Migration
  def change
    add_column :sections, :user_id, :integer
  end
end
