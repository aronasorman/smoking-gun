class Hspq < ActiveRecord::Base
  attr_accessible :A, :B, :C, :D, :E, :G, :Q2, :Q3, :Q4, :student_id

  belongs_to :student
end
