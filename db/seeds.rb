# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
nature_of_problems = NatureOfProblemType.create([{name: 'Followup Interview'}, {name: 'Routine Interview'}, {name: 'Other'}])

sections = []

[1, 2, 3, 4].each do |year|
	('A' .. 'P').each do |title|
		sections.append Section.create([{name: year.to_s + title}])
	end
end

require 'Date'
periods = []
(-Period.num .. Period.num).each do |period_num|
	date = period_num.day.from_now.to_date
	Period.per_day.times do |day_num|
		periods.append Period.create({date: date, num: day_num})
	end
end
