class CreateUsersCourses < ActiveRecord::Migration
  	def self.up
    	create_table :courses_users,:id=>false do |t|
     		t.references  :courses
    		t.references  :users

      		t.timestamps
    	end
  	end

  	def self.down
	    drop_table :users_courses
  	end
end
