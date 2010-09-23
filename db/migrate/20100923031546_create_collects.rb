class CreateCollects < ActiveRecord::Migration
  def self.up
    create_table :collects do |t|
      t.references  :user
      t.references  :course

      t.datetime    :collected_at
      
      t.timestamps
    end
  end

  def self.down
    drop_table :collects
  end
end
