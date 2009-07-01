# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
	
 	before_filter :set_current_user		

    filter_access_to :all 
	
  # include all helpers, all the time	
    helper :all 
    helper_method :current_user_session, :current_user
    protect_from_forgery # See ActionController::RequestForgeryProtection for details

  # Scrub sensitive parameters from your log
	filter_parameter_logging :password, :password_confirmation
	
  # Start of declaration_authorization-related code
	  def permission_denied
	    respond_to do |format|
	    flash[:error] = 'Sorry, you are not allowed to view the requested page.'
	    format.html { redirect_to root_url }
	    format.xml  { head :unauthorized }
	    format.js   { head :unauthorized }
	    end
	  end
    private
      def current_user_session
        return @current_user_session if defined?(@current_user_session)
        @current_user_session = UserSession.find
      end

      def current_user
        return @current_user if defined?(@current_user)
        @current_user = current_user_session && current_user_session.user
      end

	  
  # set_current_user sets the global current user for this request.  This
  # is used by model security that does not have access to the
  # controller#current_user method.  It is called as a before_filter.
	  def set_current_user
	    Authorization.current_user = current_user
	  end
end
