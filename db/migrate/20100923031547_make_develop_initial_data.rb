class MakeDevelopInitialData < ActiveRecord::Migration

  	def self.up
  		u = User.create(:email=>"wuhy80@sohu.com", :password=>"123456")
  		u.profile = Profile.new()
  		t = User.create(:email=>"wuhy80@gmail.com", :password=>"123456")
		t.profile = Profile.new()

  		Category.create(:name=>"Listen")
  		Category.create(:name=>"Read")
  		Category.create(:name=>"Write")
  		
  		Level.create(:name=>"Low")
  		Level.create(:name=>"Middle")
  		Level.create(:name=>"High")
  		
  		Blog.create(:title=>"First blog", :summary=>"There is some test", :content=>"It's a blog", :user=>u)
  		Blog.create(:title=>"Second blog", :summary=>"There is Thingk test", :content=>"It's a blog", :user=>u)
  		
  		c = Course.new(:name=>"first", :description=>"This is a description", :gold=>"23")
  		c.level = Level.where(:name=>"Low").first
  		c.category = Category.where(:name=>"Listen").first
  		#c.author = u
  		c.save


  		f = Forum.new(:name=>"First Forum", 
  		              :description=>"This is the first and the main forum", :priority=>0);
  		f.save
  		
        t = Topic.new(:name=>"", :content=>"This is the default content", :forum=>f)
        t.save
	end

  	def self.down
  	
  	end
end
