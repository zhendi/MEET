class AddInstructorToCourse < ActiveRecord::Migration
  def self.up
    add_column  :courses, :instructor,  :string
    add_column  :courses, :instructor_description,  :text
  end

  def self.down
    remove_column :courses, :instructor
    remove_column :courses, :instructor_description
  end
end
