class Lecture < ActiveRecord::Base
  belongs_to  :course

end

# == Schema Information
#
# Table name: lectures
#
#  id                  :integer         not null, primary key
#  title               :string(255)
#  video_src           :string(255)
#  description         :text
#  course_id           :integer
#  level               :integer
#  avatar_file_name    :string(255)
#  avatar_content_type :string(255)
#  avatar_file_size    :integer
#  avatar_updated_at   :datetime
#  created_at          :datetime
#  updated_at          :datetime
#

