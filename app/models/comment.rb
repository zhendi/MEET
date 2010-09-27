class Comment < ActiveRecord::Base
	belongs_to	:blog
end

# == Schema Information
#
# Table name: comments
#
#  id         :integer         not null, primary key
#  username   :string(255)
#  email      :string(255)
#  title      :string(255)
#  memo       :text
#  blog_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

