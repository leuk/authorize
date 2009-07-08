class Article < ActiveRecord::Base
	
	
	# Handling paperclip attached images for user sections 
	 has_attached_file :image,
	    :styles => { :small=>"150x150>"  , :thumb=>"200>" },
	  	:url  => "/assets/articles/:id/:style/:basename.:extension",
	  	:path => ":rails_root/public/assets/articles/:id/:style/:basename.:extension"
	  	
	# Paperclip Validations	
	  # validates_attachment_presence :image
	  validates_attachment_size :image, :less_than => 100.kilobytes
	  validates_attachment_content_type :image, :content_type => ['image/jpeg', 'image/png']	
	  
	# An article belongs to one and only one section
	  belongs_to :section , :counter_cache => true 	
end
