class CreateTopics < ActiveRecord::Migration
  def self.up
    create_table :topics do |t|
      t.string  :name
      t.text    :content

      t.references  :forum

      t.integer :forum_posts_count, :default=>0
      t.boolean :stick, :default=>false

      t.integer :ding, :default=>0
      t.integer :cai, :default=>0

      t.integer :gold

      t.timestamps
    end
  end

  def self.down
    drop_table :topics
  end
end
