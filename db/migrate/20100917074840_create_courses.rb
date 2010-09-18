class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string      :name             	# 课程名字
      t.text        :description      	# 课程描述
      t.string      :image_url
      
      t.integer		:gold						# 说金
      t.references	:level,	:null=>false		# 级别
      t.references	:category,	:null=>false	# 分类
      t.references  :user          	# 课程隶属于哪个老师
      t.integer     :users_count      	# 合计有多少个用户

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
