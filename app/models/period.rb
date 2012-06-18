class Period < ActiveRecord::Base
  attr_accessible :date, :num, :per_day

  has_many :entries
  has_many :interviews
  has_many :schedule_entries

  def self.per_day 
  	16
  end

  def self.labels
    [
      'Period 1 - Student 1',
      'Period 1 - Student 2',
      'Period 2 - Student 1',
      'Period 2 - Student 2',
      'Period 3 - Student 1',
      'Period 3 - Student 2',
      'Period 4 - Student 1',
      'Period 4 - Student 2',
      'Period 5 - Student 1',
      'Period 5 - Student 2',
      'Period 6 - Student 1',
      'Period 6 - Student 2',
      'Period 7 - Student 1',
      'Period 7 - Student 2',
      'Period 8 - Student 1',
      'Period 8 - Student 2',
    ]
  end

  def self.num 
  	case Rails.env
    when "production"
      365
  	else
      16
	  end
	end
end
