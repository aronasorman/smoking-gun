class Ssha < ActiveRecord::Base
  attr_accessible :DA, :EA, :TA, :WM, :student_id

  belongs_to :student
end
