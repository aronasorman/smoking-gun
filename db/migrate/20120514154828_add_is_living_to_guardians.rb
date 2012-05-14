class AddIsLivingToGuardians < ActiveRecord::Migration
  def change
    add_column :guardians, :is_living, :string
  end
end
