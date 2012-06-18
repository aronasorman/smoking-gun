FactoryGirl.define do
	factory :section do
		name "1A"
		user_id { FactoryGirl.create(:user, :role => "Counselor").id }
	end
end
