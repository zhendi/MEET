class User < ActiveRecord::Base
	has_many	:blogs
	has_and_belongs_to_many :courses

	devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable
	# devise  :confirmable,:recoverable, 
end
