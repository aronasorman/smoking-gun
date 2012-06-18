FactoryGirl.define do
  factory :student do
  	student_id 11341
  	first_name "Sam Lorraine"
  	middle_name "C."
  	last_name "Chan"
  	section_id { FactoryGirl.create(:section, :name => 1).id }	
  end
end
