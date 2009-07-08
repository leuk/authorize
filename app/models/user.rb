class User < ActiveRecord::Base
	  
	# Handling paperclip attached images for user avatars 
	 has_attached_file :avatar, :styles => { :small=>"150x150>",:thumb=>"50x50>",
	 										   :avatar=>"250x250>" },
		                  :url  => "/assets/avatars/:id/:style/:basename.:extension",
		                  :path => ":rails_root/public/assets/avatars/:id/:style/:basename.:extension"
	#Paperclip Validations	
	  validates_attachment_presence :avatar
	  validates_attachment_size :avatar, :less_than => 100.kilobytes
	  validates_attachment_content_type :avatar, :content_type => ['image/jpeg', 'image/png']	
		
	# Including the authentication bundle
	  acts_as_authentic	
	  
	# A user may post some articles in the apllication 
	  has_many :articles	
	
	# Including the authorization bundle
	  has_many :roles
	  def role_symbols
	     (roles || []).map {|r| r.title.to_sym}
	  end
   
end
