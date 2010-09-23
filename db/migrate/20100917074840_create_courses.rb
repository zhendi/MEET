class CreateCourses < ActiveRecord::Migration
  def self.up
    create_table :courses do |t|
      t.string      :name             			# 课程名字
      t.text        :description      			# 课程描述
      t.string      :avatar_file_name           # 图片名称
      t.string      :avatar_content_type
      t.integer     :avatar_file_size
      t.datetime    :avatar_updated_at
      
      t.integer		:gold						# 说金
      t.references	:level,	:null=>false		# 级别
      t.references	:category,	:null=>false	# 分类
      t.integer     :author_id                 # 课程隶属于哪个老师

      t.timestamps
    end
  end

  def self.down
    drop_table :courses
  end
end
