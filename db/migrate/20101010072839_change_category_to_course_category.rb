class ChangeCategoryToCourseCategory < ActiveRecord::Migration
  def self.up
    rename_column :courses, :category_id, :course_category_id
  end

  def self.down
    rename_column :courses, :course_category_id,  :category_id
  end
end
