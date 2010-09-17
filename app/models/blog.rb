class Blog < ActiveRecord::Base
  	belongs_to	:user
  	has_many	:comments,  :dependent=>:destroy
  	acts_as_taggable  

	validates	:title,	:presence=>true
	validates	:content,	:presence=>true, :length=>{:minimum=>5}
    
	cattr_reader :per_page
	@@per_page = 2
end
