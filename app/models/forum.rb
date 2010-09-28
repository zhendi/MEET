class Forum < ActiveRecord::Base
  has_many  :topics
  PRIORITY = {"1"=>"1", "2"=>"2", "3"=>"3","4"=>"4","5"=>"5"}

end

# == Schema Information
#
# Table name: forums
#
#  id           :integer         not null, primary key
#  name         :string(255)
#  description  :string(255)
#  priority     :integer         default(0)
#  topics_count :integer         default(0)
#  created_at   :datetime
#  updated_at   :datetime
#

