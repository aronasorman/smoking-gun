class Dat < ActiveRecord::Base
  attr_accessible :abstract, :language, :mechanical, :numerical, :spacer_relation, :spelling, :student_id, :verbal

belongs_to :student
end
