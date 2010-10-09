class CreateSchools < ActiveRecord::Migration
  def self.up
    create_table :schools do |t|
      t.string  :name
      t.references  :course_category

      t.timestamps
    end

    add_column  :course_categories, :school_id, :integer, :null=>false, :default=>0
  end

  def self.down
    drop_table :schools

    remove_column :courses, :school_id
  end
end
