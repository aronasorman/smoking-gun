class Student < ActiveRecord::Base
  attr_accessible :address, :birthdate, :birthplace, :celno, :email, :family_concerns, :first_name, :interests, :is_special_guidance_needed, :last_name, :middle_name, :most_significant_person, :nickname, :picture, :section_id, :sibling_comments, :special_guidance_elaboration, :telno, :why_significant, :work_experience
end
