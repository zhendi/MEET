class Comment < ActiveRecord::Base
  belongs_to  :user
  belongs_to  :blog
end


# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  email      :string(255)
#  title      :string(255)
#  memo       :text
#  blog_id    :integer
#  created_at :datetime
#  updated_at :datetime
#  user_id    :integer
#

