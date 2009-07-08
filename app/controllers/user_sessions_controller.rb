class UserSessionsController < ApplicationController
	
  before_filter :new_user_session, :only => :new	
	
  filter_access_to :all 	
	
  def new
    #@user_session = UserSession.new
  end
  
  def create
    @user_session = UserSession.new(params[:user_session])
    if @user_session.save
      flash[:notice] = t('user_session_created')
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def destroy
    current_user_session.destroy
    flash[:notice] = t('user_session_deleted')
    redirect_to root_url
  end
  
  private 
  	def new_user_session
  		@user_session = UserSession.new
  	end
end
