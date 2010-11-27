class ChangeLectureType < ActiveRecord::Migration
  def self.up
    Lecture.delete_all

    change_column :lectures,  :video_src, :text
    
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
    change_column :lectures,  :video_src, :string
  end
end
