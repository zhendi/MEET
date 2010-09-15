class CreateBlogs < ActiveRecord::Migration
  def self.up
    create_table :blogs do |t|
      t.string	      :title
      t.text          :summary
      t.text	      :content
      t.integer       :ding,  :default=>0
      t.integer       :cai,   :default=>0
      t.integer       :readcount, :default=>0
      t.references    :user

      t.timestamps
    end
  end

  def self.down
    drop_table :blogs
  end
end
