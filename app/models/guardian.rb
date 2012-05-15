class Guardian < ActiveRecord::Base
  attr_accessible :age, :celno, :email, :name, :occupation, :religion, :student_id, :telno, :guardian_type, :work_address
  attr_accessible :is_living

  belongs_to :student

  validates :age, :numericality => {:greater_than_or_equal_to => 0}
end
