class Period < ActiveRecord::Base
  attr_accessible :date, :num

  has_many :entries
  has_many :interviews
end
