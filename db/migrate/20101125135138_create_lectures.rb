class CreateLectures < ActiveRecord::Migration
  def self.up
    create_table :lectures do |t|
      t.string  :title
      t.string  :video_src
      t.text    :description

      t.references  :course
      t.integer     :level

      t.string      :avatar_file_name           # 图片名称
      t.string      :avatar_content_type
      t.integer     :avatar_file_size
      t.datetime    :avatar_updated_at

      t.timestamps
    end

    comments = Comment.where("commentable_type='Course'").all
    comments.each do |comment|
      lecture = Lecture.new()
      lecture.course_id = comment.commentable_id
      lecture.video_src = comment.memo
      lecture.title = comment.title

      lecture.save()
    end
  end

  def self.down
    drop_table :lectures
  end
end
