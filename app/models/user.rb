class User < ActiveRecord::Base
	has_many	:blogs
	has_many    :forum_posts
	has_one     :profile
	
	devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable	
end
