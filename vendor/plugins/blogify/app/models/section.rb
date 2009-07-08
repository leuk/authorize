class Section < ActiveRecord::Base
	
	# Handling paperclip attached images for user sections 
	 has_attached_file 	:image, 
	    :styles => { :small=>"150x150>",:thumb=>"50x50>"},
		:url  => "/assets/sections/:id/:style/:basename.:extension",
		:path => ":rails_root/public/assets/sections/:id/:style/:basename.:extension"
		
	# Paperclip Validations	
	  validates_attachment_presence :image
	  validates_attachment_size :image, :less_than => 100.kilobytes
	  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']	
	  
	# A section may contain some articles , lets get make that work
	  has_many :articles 
end
