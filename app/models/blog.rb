class Blog < ActiveRecord::Base
  belongs_to  :user
  has_many    :comments, :as => :commentable
  acts_as_taggable  

  validates	:title,	:presence=>true
  validates	:content,	:presence=>true, :length=>{:minimum=>5}

  cattr_reader :per_page
  @@per_page = 5

  after_create :log_activity

  def log_activity
    activity = Activity.create!(:item => self, :user => user)
    add_activities(:activity => activity, :user => user)
  end
end

# == Schema Information
#
# Table name: blogs
#
#  id         :integer         not null, primary key
#  title      :string(255)
#  summary    :text
#  content    :text
#  ding       :integer         default(0)
#  cai        :integer         default(0)
#  readcount  :integer         default(0)
#  user_id    :integer         not null
#  created_at :datetime
#  updated_at :datetime
#

