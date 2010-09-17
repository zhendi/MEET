class AddUserMoneyAndAccumulate < ActiveRecord::Migration
  def self.up
    add_column  :users,   :gold,  :integer, :default=>0
    add_column  :users,   :score, :integer, :default=>0
  end

  def self.down
    remove_column :users,   :gold
    remove_column :users,   :score
  end
end
