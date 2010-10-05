class AddOwnerToForum < ActiveRecord::Migration
  def self.up
    remove_column :comments,  :username
    add_column  :comments,  :user_id, :integer

    add_column  :topics,  :user_id, :integer
    add_column  :topics,  :answers_count, :integer, :default=>0
  end

  def self.down
    remove_column :topics,  :answers_count
    remove_column :topics,  :user_id

    remove_column :comments,  :user_id
    add_column  :comments,  :username
  end
end
