class ModifyCoursesAddId < ActiveRecord::Migration
  def self.up
    add_column  :courses, :subject_id,  :integer, :null=>false, :default=>0
    add_column  :courses, :school_id, :integer, :null=>false, :default=>0
  end

  def self.down
    remove_column :courses, :subject_id
    remove_column :courses, :school_id
  end
end
