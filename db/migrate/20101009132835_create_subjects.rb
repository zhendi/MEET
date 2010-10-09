class CreateSubjects < ActiveRecord::Migration
  def self.up
    create_table :subjects do |t|
      t.string  :name
      t.integer :parent_id

      t.references  :course_category

      t.timestamps
    end

    add_column  :courses, :subject_id,  :integer, :null=>false, :default=>0
  end

  def self.down
    drop_table :subjects

    remove_column :courses, :subject_id
  end
end
