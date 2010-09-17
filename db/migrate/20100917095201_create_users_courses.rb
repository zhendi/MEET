class CreateUsersCourses < ActiveRecord::Migration
  def self.up
    create_table :users_courses,:id=>false do |t|
      t.references  :users
      t.references  :courses

      t.timestamps
    end
  end

  def self.down
    drop_table :users_courses
  end
end
