class CreateForums < ActiveRecord::Migration
  def self.up
    create_table :forums do |t|
      t.string  :name
      t.string  :description, :limit=>255
      t.integer :priority, :default=>0
      t.integer :topics_count,  :default=>0

      t.timestamps
    end
  end

  def self.down
    drop_table :forums
  end
end
