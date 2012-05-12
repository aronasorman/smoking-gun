class Period < ActiveRecord::Base
  attr_accessible :date, :num, :per_day

  has_many :entries
  has_many :interviews
  has_many :schedule_entries

  def self.per_day 
  	16
  end

  def self.num 
  	case Rails.env
  	when "development"
  		16
  	else
	  	365
	  end
	end
end
