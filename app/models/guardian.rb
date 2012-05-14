class Guardian < ActiveRecord::Base
  attr_accessible :age, :celno, :email, :name, :occupation, :religion, :student_id, :telno, :guardian_type, :work_address
  attr_accessible :is_living

  belongs_to :student
end
