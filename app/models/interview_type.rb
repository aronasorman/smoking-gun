class InterviewType < ActiveRecord::Base
  attr_accessible :name

  has_many :schedule_entries
  has_many :interviews
end
