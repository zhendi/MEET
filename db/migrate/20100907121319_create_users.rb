class CreateUsers < ActiveRecord::Migration
  class User < ActiveRecord::Base
    devise :database_authenticatable, :rememberable, :trackable, :validatable, :registerable
  end

  def self.up
    create_table :users do |t|
    	t.database_authenticatable
		#t.confirmable
		#t.recoverable
		t.rememberable
		t.trackable

		t.integer :blogs_count,  :default=>0
		t.string  :display_name

		t.timestamps
    end
    User.create!(:email=>"wuhy80@gmail.com", :password=>"whyaqqp", :display_name=>"wuhy80")
  end

  def self.down
    drop_table :users
  end
end
