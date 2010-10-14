class ModifyUser < ActiveRecord::Migration
  def self.up
    remove_column :users,  :display_name
    add_column  :users,  :role_id, :integer
  end

  def self.down
    add_column  :users,  :display_name,  :string
    remove_column :users,  :role_id
  end
end
