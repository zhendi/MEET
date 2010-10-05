class ModifyAnswerCount < ActiveRecord::Migration
  def self.up
    add_column :users, :answers,  :integer, :default=>0
  end

  def self.down
    remove_column :users, :answers
  end
end
