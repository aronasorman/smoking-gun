class AddAlmaMatterToGuardians < ActiveRecord::Migration
  def change
    add_column :guardians, :alma_mater, :string
  end
end
