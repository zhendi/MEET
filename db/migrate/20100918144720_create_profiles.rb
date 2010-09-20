class CreateProfiles < ActiveRecord::Migration
  def self.up
    create_table :profiles do |t|
      t.string  :avatar_file_name
      t.string  :avatar_content_type
      t.integer :avatar_file_size
      t.datetime  :avatar_updated_at
      
      t.string  :name
      t.string  :address
      t.string  :mobile
      t.string  :home_phone
      t.integer :age
      t.boolean :sex, :default=>false

      t.timestamps
    end
  end

  def self.down
    drop_table :profiles
  end
end
