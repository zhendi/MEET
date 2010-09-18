class CreateUsers < ActiveRecord::Migration

  def self.up
    create_table :users do |t|
    	t.string	:type
    	
    	t.database_authenticatable
		#t.confirmable
		#t.recoverable
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
