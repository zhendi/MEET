class CreateForumPosts < ActiveRecord::Migration
  def self.up
    create_table :forum_posts do |t|
      t.string  :title
      t.text    :content
      
      t.references  :user
      t.references  :topic

      t.timestamps
    end
  end

  def self.down
    drop_table :forum_posts
  end
end
