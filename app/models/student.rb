class Student < ActiveRecord::Base
  attr_accessible :address, :birthdate, :birthplace, :celno, :email, :family_concerns, :first_name, :interests, :is_special_guidance_needed, :last_name, :middle_name, :most_significant_person, :nickname, :picture, :section_id, :sibling_comments, :special_guidance_elaboration, :telno, :why_significant, :work_experience

  attr_accessible :student_id, :religion, :citizenship, :grade_school

  belongs_to :section

  has_many :guardians

  def self.import(file)
    require 'Date'
  	data = file.read
  	CSV.parse(data, :headers => true, :encoding => "UTF-8", :header_converters => :symbol).each do |row|
  		id = row[:studno].gsub('-', '').to_i # remove the dash
  		student = Student.find_or_create_by_student_id(id)

      section = row[:clno][0..1]
      student.section = Section.find_by_name(section) 
      student.first_name = row[:fname].gsub(150.chr, '') # we do these gsubs so that the blasted \x96 char will be eliminated
      student.middle_name = row[:mname].gsub(150.chr, '') unless row[:mname].nil? # apparently there are people without middle names
      student.last_name = row[:lname].gsub(150.chr, '')

      student.birthplace = row[:placeofbirth].gsub(150.chr, '') unless row[:placeofbirth].nil?
      student.birthdate = Student.parse_date row[:dateofbirth]
      student.telno = row[:tel1].gsub(150.chr, '') unless row[:tel1].nil?
      student.celno = row[:tel2].gsub(150.chr, '') unless row[:tel2].nil?
      student.grade_school = row[:gs_name]

  		student.save
  	end
  end

  def self.parse_date(date_raw)
    month, day, year = date_raw.split('/').map {|x| x.to_i}
    year += 1900 if year > 50 else 2000
    Date.new year, month, day
  end
end
