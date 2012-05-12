class Student < ActiveRecord::Base
  attr_accessible :address, :birthdate, :birthplace, :celno, :email, :family_concerns, :first_name, :interests, :is_special_guidance_needed, :last_name, :middle_name, :most_significant_person, :nickname, :picture, :section_id, :sibling_comments, :special_guidance_elaboration, :telno, :why_significant, :work_experience

  attr_accessible :student_id, :religion, :citizenship, :grade_school

  belongs_to :section

  has_many :guardians
  has_many :interviews
  has_many :schedule_entries

  def self.import(file)
    require 'Date'
  	data = file.read
  	CSV.parse(data.gsub(150.chr, 'n'), :headers => true, :encoding => "r:ISO8859-1", :header_converters => :symbol).each do |row|
  		id = row[:studno].gsub('-', '').to_i # remove the dash
  		student = Student.find_or_create_by_student_id(id)

      section = row[:clno][0..1]
      student.section = Section.find_by_name(section) 
      student.first_name = row[:fname]
      student.middle_name = row[:mname]
      student.last_name = row[:lname]

      student.birthplace = row[:placeofbirth]
      student.birthdate = Student.parse_date row[:dateofbirth]
      student.telno = row[:tel1]
      student.celno = row[:tel2]
      student.grade_school = row[:gs_name]

      father = Guardian.new
      father_last_name = row[:pa_lname]
      father_first_name = row[:pa_fname]
      father.name = [father_last_name, father_first_name].join ' '
      father.occupation = row[:pa_occu]
      father.work_address = row[:pa_office_add]

      student.guardians = [father]
  		student.save
  	end
  end

  def self.parse_date(date_raw)
    month, day, year = date_raw.split('/').map {|x| x.to_i}
    year += 1900 if year > 50 else 2000
    Date.new year, month, day
  end
end
