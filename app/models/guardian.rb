class Guardian < ActiveRecord::Base
  attr_accessible :age, :celno, :email, :name, :occupation, :religion, :student_id, :telno, :type, :work_address

  belongs_to :student
end
