class Section < ActiveRecord::Base
  attr_accessible :name, :year

  belongs_to :users
end
