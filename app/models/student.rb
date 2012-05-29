class Student < ActiveRecord::Base
  attr_accessible :address, :birthdate, :birthplace, :celno, :email, :family_concerns, 
                  :first_name, :interests, :is_special_guidance_needed, :last_name, 
                  :middle_name, :most_significant_person, :nickname, :picture, 
                  :section_id, :sibling_comments, :special_guidance_elaboration,
                   :telno, :why_significant, :work_experience, :photo

  attr_accessible :student_id, :religion, :citizenship, :grade_school

  belongs_to :section

  has_many :guardians
  has_many :interviews
  has_many :schedule_entries

  def to_s
    [self.first_name, self.last_name].join ' '
  end

  def self.archive_all
    archived_section = Section.find_by_name "Archived"
    Student.update_all :section_id => archived_section.id
  end

  has_one :ssha
  has_one :hspq
  has_one :mpcl
  has_one :dat
  has_attached_file :photo, :styles => {:small => "150x150!", :medium => "300x300>", :thumbnail => "100x100!"}

  def self.import(file)
    require 'date'
  	data = file.read
  	CSV.parse(data.gsub(150.chr, 'n'), :headers => true, :header_converters => :symbol).each do |row|
  		id = row[:studno].gsub('-', '').to_i # remove the dash
  		student = Student.find_or_create_by_student_id(id)

      section = row[:clno][0..1]
      student.section = Section.find_or_create_by_name(section) 
      student.first_name = row[:fname]
      student.middle_name = row[:mname]
      student.last_name = row[:lname]

      student.birthplace = row[:placeofbirth]
      student.birthdate = Student.parse_date row[:dateofbirth]
      student.telno = row[:tel1]
      student.celno = row[:tel2]
      student.grade_school = row[:gs_name]

      father = Guardian.new
      father.guardian_type = 'Father'
      father.age = 0
      father_last_name = row[:pa_lname]
      father_first_name = row[:pa_fname]
      father_title = row[:pa_title]
      father.name = [father_title, father_first_name, father_last_name].join ' '
      father.occupation = row[:pa_occu]
      father.work_address = row[:pa_office_add]
      father.telno = row[:pa_telno]
      father.email = row[:pa_email]
      father.is_living = row[:living]

      mother = Guardian.new
      mother.guardian_type = 'Mother'
      mother.age = 0
      mother_last_name = row[:pa_lname]
      mother_first_name = row[:pa_fname]
      mother_title = row[:ma_title]
      mother.name = [mother_title, mother_first_name, mother_last_name].join ', '
      mother.occupation = row[:ma_occup]
      mother.work_address = row[:ma_office_add]
      mother.telno = row[:ma_tel]
      mother.religion = row[:ma_relig]
      mother.email = row[:ma_email]
      mother.is_living = row[:ma_livi]

      student.guardians = [father, mother]
  		student.save
  	end
  end

  def self.parse_date(date_raw)
    month, day, year = date_raw.split('/').map {|x| x.to_i}
    year += 1900 if year > 50 else 2000
    Date.new year, month, day
  end
end
