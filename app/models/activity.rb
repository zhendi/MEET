class Activity < ActiveRecord::Base
  belongs_to :user
  belongs_to :item, :polymorphic => true
  has_many   :feeds, :dependent => :destroy
  
  GLOBAL_FEED_SIZE = 10

  # Return a feed drawn from all activities.
  # The fancy SQL is to keep inactive people out of feeds.
  # It's hard to do that entirely, but this way deactivated users 
  # won't be the person in "<person> has <done something>".
  #
  # This is especially useful for sites that require email verifications.
  # Their 'connected with admin' item won't show up until they verify.
  def self.global_feed
    find(:all, 
         :joins => "INNER JOIN user u ON activities.user_id = u.id",
         :conditions => [%(u.deactivated = ? AND
                           (u.email_verified IS NULL OR 
                            u.email_verified = ?)), 
                         false, true], 
         :order => 'activities.created_at DESC',
         :limit => GLOBAL_FEED_SIZE)
  end
end

# == Schema Information
#
# Table name: activities
#
#  id         :integer         not null, primary key
#  public     :boolean
#  item_id    :integer
#  item_type  :string(255)
#  user_id    :integer
#  created_at :datetime
#  updated_at :datetime
#

