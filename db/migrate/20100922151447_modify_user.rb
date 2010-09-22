class ModifyUser < ActiveRecord::Migration
  def self.up
    remove_column :users,  :display_name
    add_column  :users,  :role_id, :integer

    create_table :roles do |t|
      t.string :name,  :limit=>20
    end
  end

  def self.down
    add_column  :users,  :display_name,  :string
    remove_column :users,  :role_id

    drop_table  :roles
  end
end
