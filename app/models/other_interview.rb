class OtherInterview < ActiveRecord::Base
  attr_accessible :content

  belongs_to :interview
end
