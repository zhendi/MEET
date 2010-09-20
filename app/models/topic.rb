class Topic < ActiveRecord::Base
  has_many  :forum_posts
  belongs_to  :forum
  acts_as_taggable

end
