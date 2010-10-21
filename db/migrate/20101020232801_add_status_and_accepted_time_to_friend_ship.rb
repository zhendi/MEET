class AddStatusAndAcceptedTimeToFriendShip < ActiveRecord::Migration
  def self.up
    add_column  :friendships, :status,  :integer
    add_column  :friendships, :accepted_at, :datetime
  end

  def self.down
    remove_column :friendships, :status
    remove_column :friendships, :accepted_at
  end
end
