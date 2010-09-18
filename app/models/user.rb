class User < ActiveRecord::Base
	has_many	:blogs
	
	devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable	
end
