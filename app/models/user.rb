class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :token_authenticatable, :encryptable, :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable, :timeoutable,
         :recoverable, :rememberable, :trackable, :validatable

  # Setup accessible (or protected) attributes for your model
  attr_accessible :username, :email, :password, :password_confirmation, :remember_me
  # attr_accessible :title, :body
  attr_accessible :name, :role, :is_head_counselor, :is_counselor, :is_secretary

  has_many :sections
  has_many :interviews
  has_many :schedule_entries

  accepts_nested_attributes_for :sections

  validates :username, numericality: {greater_than_or_equal_to: 0.01}
end
