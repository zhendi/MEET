class CreateUsers < ActiveRecord::Migration

  def self.up
    create_table :users do |t|
    	t.database_authenticatable
		t.rememberable
		t.trackable

		t.integer :blogs_count,  :default=>0
		t.string  :display_name
		
		t.timestamps
    end
  end

  def self.down
    drop_table :users
  end
end
