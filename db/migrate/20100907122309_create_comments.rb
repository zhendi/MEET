class CreateComments < ActiveRecord::Migration
  def self.up
    create_table :comments do |t|
      t.string		:username
      t.string		:email
      t.string		:title
      t.text		:memo
      t.references	:blog

      t.timestamps
    end
  end

  def self.down
    drop_table :comments
  end
end
