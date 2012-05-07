class ScheduleEntry < ActiveRecord::Base
  # attr_accessible :title, :body
  belongs_to :interview_type
  belongs_to :period
  # has_one :student
end
