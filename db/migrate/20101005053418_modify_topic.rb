class ModifyTopic < ActiveRecord::Migration
  def self.up
    rename_column :topics, :answers_count, :views
  end

  def self.down
    rename_column :topics, :views, :answers_count
  end
end
