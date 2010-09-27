class Level < ActiveRecord::Base
	has_many	:courses
end

# == Schema Information
#
# Table name: levels
#
#  id         :integer         not null, primary key
#  name       :string(180)
#  created_at :datetime
#  updated_at :datetime
#

