class AddIsDraftToInterviews < ActiveRecord::Migration
  def change
    add_column :interviews, :is_draft, :boolean, default: false
  end
end
