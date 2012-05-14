class FollowupInterview < ActiveRecord::Base
  attr_accessible :comments, :planned_intervention, :nature_of_problem_type_id

  belongs_to :interview
  belongs_to :nature_of_problem_type
end
