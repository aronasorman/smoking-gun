require 'spec_helper'

describe Student do
	context "self.archive_all" do
		it "should archive all students" do
			section_archived = FactoryGirl.create(:section, :name => "Archived")
			section = FactoryGirl.create(:section, :name => "2A", :user => FactoryGirl.create(:user, :email => "asakapa@asa.com"))		
			student1 = FactoryGirl.create(:student, :section_id => section.id, :student_id => 1)
			student2 = FactoryGirl.create(:student, :section_id => section.id, :student_id => 2)
			Student.archive_all
			student1.reload
			student2.reload
			student1.section.should eq section_archived
			student2.section.should eq section_archived
		end	
	end
end
