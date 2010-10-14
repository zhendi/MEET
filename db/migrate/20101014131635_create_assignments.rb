class CreateAssignments < ActiveRecord::Migration
  def self.up
    create_table :assignments do |t|
      t.references  :user
      t.references  :role

      t.timestamps
    end

    remove_column :users, :role_id
  end

  def self.down
    drop_table :assignments

    add_column  :users, :role_id, :integer
  end
end
