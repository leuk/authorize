authorization do
 
 role :guest do
     has_permission_on :users, :to => :create
     has_permission_on :articles, :to => :read
     has_permission_on :sections, :to => :read
     has_permission_on :user_sessions, :to => :create
  end
  
  role :user do
    includes :guest
    has_permission_on :users, :to => :create
    has_permission_on :users, :to => :read 
    has_permission_on :users, :to => :update 
    has_permission_on :user_sessions, :to => :delete
  end
  
  role :admin do
  	includes :user
    has_permission_on :users, :to => :manage
    has_permission_on :roles, :to => :manage
    has_permission_on :articles, :to => :manage
     has_permission_on :sections, :to => :manage
    has_permission_on :user_sessions, :to => :manage    
    has_permission_on :user_sessions, :to => :delete
    has_permission_on :authorization_rules, :to => :read
    has_permission_on :authorization_usages, :to => :read  	
  end
  
end

privileges do
	
  privilege :manage, :includes => [:create, :read, :update, :delete]
  privilege :read, :includes => [:index, :show]
  privilege :create, :includes => :new
  privilege :update, :includes => :edit
  privilege :delete, :includes => :destroy
  
end