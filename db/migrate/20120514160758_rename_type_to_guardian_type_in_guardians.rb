class RenameTypeToGuardianTypeInGuardians < ActiveRecord::Migration
  def up
  	rename_column :guardians, :type, :guardian_type
  end

  def down
  	rename_column :guardians, :guardian_type, :type
  end
end
