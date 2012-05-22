# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
InterviewType = InterviewType.create([{name: 'Followup Interview'}, {name: 'Routine Interview'}, {name: 'Other Interview'}])

NatureOfProblemType.create!([{name: 'Family'}, {name: 'Academics'}, {name: 'Friends'}, {name: 'Others'}])

Section.create {year: 0, name: "Archived"}

require 'date'
periods = []
(-Period.num .. Period.num).each do |period_num|
	date = period_num.day.from_now.to_date
	Period.per_day.times do |day_num|
		periods.append Period.create({date: date, num: day_num})
	end
end
