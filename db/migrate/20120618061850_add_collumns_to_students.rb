class AddCollumnsToStudents < ActiveRecord::Migration
  def change
    add_column :students, :subjects_good_at, :text
    add_column :students, :subjects_bad_at, :text
    add_column :students, :study_buddy_outside_class, :text
    add_column :students, :study_time_outside_class, :integer
    add_column :students, :where_you_study_outside_class, :text
    add_column :students, :conflicts_with_studying, :text
    add_column :students, :being_tutored, :boolean
    add_column :students, :need_special_guidance, :boolean
    add_column :students, :special_guidance_explanation, :text
    add_column :students, :talents_or_skills, :text
    add_column :students, :extracurricular_activities, :text
    add_column :students, :leisure_time, :text
    add_column :students, :add_topics_in_guidance_class, :string
    add_column :students, :additional_info_for_counselor, :text
    add_column :students, :present_concers, :text
    add_column :students, :who_you_talk_to_about_personal_stuff, :text
    add_column :students, :college, :string
  end
end
