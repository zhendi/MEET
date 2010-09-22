class AddProfileInfo < ActiveRecord::Migration
  def self.up
    add_column  :profiles, :english_name,  :string
    add_column  :profiles, :birthday,  :date
    add_column  :profiles, :star,  :string

    add_column  :profiles, :home_province, :string
    add_column  :profiles, :home_city, :string

    add_column  :profiles, :english_level,  :string

    add_column  :profiles, :msn, :string
    add_column  :profiles, :qq,  :string
    add_column  :profiles, :gmail, :string
    add_column  :profiles, :blog,  :string
    add_column  :profiles, :homepage,  :string

    create_table :provinces  do |t|
      t.string  :name,  :limit=>30
    end

    create_table :cities do |t|
      t.string  :name,  :limit=>30
      t.references :provinces
    end

    add_column :profiles, :company, :string
    add_column :profiles, :company_description, :text
    add_column :profiles, :company_province,  :string
    add_column :profiles, :company_city,  :string

    add_column :profiles, :education_level, :string
    add_column :profiles, :school_name, :string
    add_column :profiles, :income_year, :integer

    add_column :profiles, :interest,  :text
    add_column :profiles, :loved_music, :text
    add_column :profiles, :loved_movie, :text
    add_column :profiles, :loved_game,  :text
    add_column :profiles, :loved_sport, :text
    add_column :profiles, :loved_person,  :text
    add_column :profiles, :self_description,  :text
  end

  def self.down
    remove_column :profiles, :english_name
    remove_column :profiles, :birthday
    remove_column :profiles, :star

    remove_column :profiles, :home_province
    remove_column :profiles, :home_city

    remove_column :profiles, :english_level

    remove_column :profiles, :msn
    remove_column :profiles, :qq
    remove_column :profiles, :gmail
    remove_column :profiles, :blog
    remove_column :profiles, :homepage

    drop_table  :provinces
    drop_table  :cities

    remove_column :profiles, :company
    remove_column :profiles, :company_description
    remove_column :profiles, :company_province
    remove_column :profiles, :company_city

    remove_column :profiles, :education_level
    remove_column :profiles, :school_name
    remove_column :profiles, :income_year

    remove_column :profiles, :interest
    remove_column :profiles, :loved_music
    remove_column :profiles, :loved_movie
    remove_column :profiles, :loved_game
    remove_column :profiles, :loved_sport
    remove_column :profiles, :loved_person
    remove_column :profiles, :self_description
  end
end
