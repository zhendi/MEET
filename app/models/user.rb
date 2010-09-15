class User < ActiveRecord::Base
	has_many	:blog
	devise :database_authenticatable, :confirmable, :recoverable, :rememberable, :trackable, :validatable, :registerable
end
