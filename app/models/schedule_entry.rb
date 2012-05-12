class ScheduleEntry < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :interview_type
  belongs_to :period
  belongs_to :user
  belongs_to :student
end
