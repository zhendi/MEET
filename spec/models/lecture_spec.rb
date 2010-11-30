require 'spec_helper'

describe Lecture do
  pending "add some examples to (or delete) #{__FILE__}"
end


# == Schema Information
#
# Table name: lectures
#
#  id                  :integer         not null, primary key
#  title               :string(255)
#  video_src           :text(255)
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

