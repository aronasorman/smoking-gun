class RoutineInterview < ActiveRecord::Base
  attr_accessible :academic_history, :family_relationship, :general_mental_ability, :goals, :interview_id, :peer_relationship, :personal_emotional, :recommendation

  belongs_to :interview
end
