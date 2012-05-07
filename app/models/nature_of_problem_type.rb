class NatureOfProblemType < ActiveRecord::Base
  attr_accessible :name

  has_many :followup_interviews
end
