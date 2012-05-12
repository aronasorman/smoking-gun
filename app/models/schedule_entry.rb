class ScheduleEntry < ActiveRecord::Base
  # attr_accessible :title, :body
  attr_accessible :interview_type_id, :period_id, :user_id, :student_id
  
  belongs_to :interview_type
  belongs_to :period
  belongs_to :user
  belongs_to :student
end
