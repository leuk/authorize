class UsersController < ApplicationController
	
  def index 
  	@users = User.all
  end		
  
  def show
  	@user = User.find_by_id( params[:id])
  end
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save && @user.roles.create(:title => 'user')
      flash[:notice] = t('user_created')
      redirect_to root_url
    else
      render :action => 'new'
    end
  end
  
  def edit
    @user = User.find(params[:id])
  end
  
  def update
    @user = User.find(params[:id])
    if @user.update_attributes(params[:user])
      flash[:notice] = t('user_updated')
      redirect_to user_path(@user)
    else
      render :action => 'edit'
    end
  end
end
