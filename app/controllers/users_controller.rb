class UsersController < ApplicationController
	
  def index 
  	@users = User.all
  end		
  def new
    @user = User.new
  end
  
  def create
    @user = User.new(params[:user])
    if @user.save && @user.roles.create(:title => 'user')
      flash[:notice] = "Registration Successfull."
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
      flash[:notice] = "User parameters uccesfully updated."
      redirect_to root_url
    else
      render :action => 'edit'
    end
  end
end
