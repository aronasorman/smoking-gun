class ChangeUsernameToIntegerInUsers < ActiveRecord::Migration
  def up
    change_column :users, :username, :integer
  end

  def down
    change_column :users, :username, :string
  end
end
