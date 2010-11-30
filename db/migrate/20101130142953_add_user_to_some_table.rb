class AddUserToSomeTable < ActiveRecord::Migration
  def self.up
    add_column  :categories,        :user_id, :integer
    add_column  :course_categories, :user_id, :integer
    add_column  :forums,           :user_id, :integer
    add_column  :lectures,         :user_id, :integer

    change_column :profiles,  :sex,  :string

    add_column  :schools,          :user_id, :integer
    add_column  :subjects,         :user_id, :integer

  end

  def self.down
    remove_column  :categories,         :user_id
    remove_column  :course_categories,  :user_id
    remove_column  :forums,            :user_id
    remove_column  :lectures,          :user_id

    change_column :profiles, :sex,  :boolean

    remove_column  :schools,           :user_id
    remove_column  :subjects,          :user_id
  end
end
