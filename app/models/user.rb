class User < ActiveRecord::Base
	
	# Including the authentication bundle
	  acts_as_authentic	
	  
	# Including the authorization bundle
	  has_many :roles
	  def role_symbols
	     (roles || []).map {|r| r.title.to_sym}
	  end
   
end
