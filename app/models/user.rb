class User < ActiveRecord::Base
	has_many	:blogs
	has_and_belongs_to_many :courses
	
	devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable	
end

class Student	< User
end

class Teacher	< User
end

class Admin 	< User
end