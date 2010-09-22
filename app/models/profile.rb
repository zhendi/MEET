class Profile < ActiveRecord::Base
  has_attached_file :avatar, :styles => { 
    :medium => "300x300>", :thumb => "120x120>" }
  
  belongs_to  :user
end
