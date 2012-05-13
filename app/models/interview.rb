class Interview < ActiveRecord::Base
  # attr_accessible :title, :body

  belongs_to :interview_type
  belongs_to :period
  belongs_to :user
  belongs_to :student

  has_one :followup_interview
  has_one :routine_interview
  has_one :other_interview

end
