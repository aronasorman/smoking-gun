class FollowupInterview < ActiveRecord::Base
  attr_accessible :comments, :planned_intervention

  belongs_to :interview
  belongs_to :nature_of_problem_type
end
