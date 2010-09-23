class User < ActiveRecord::Base
	has_many	:blogs
	has_many    :forum_posts
	has_one     :profile
	has_many    :collects
    has_many    :collected_courses, :through=>:collects, :source=>:course
    has_many    :owned_courses, :foreign_key=>"author_id"

	devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable	
end
