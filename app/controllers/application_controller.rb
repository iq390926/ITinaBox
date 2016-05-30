class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  after_filter :store_location
  before_action :generate_menu
  

  private

    def store_location
      # store last url as long as it isn't a /users path
      session[:previous_url] = request.fullpath unless request.fullpath =~ /\/users/
       
    end

    def after_sign_in_path_for(resource_or_scope)
      
      session[:previous_url] || root_url 
      
      # session[:previous_url] || login_url
      
      
    end

    def after_sign_out_path_for(resource_or_scope)
      "/users/sign_in"
      #request.referrer
    end
    
    def generate_menu
    	
    	puts "************* generate menu"
    	if user_signed_in?	 
	 	   #@pages = Page.where(parent_id: current_user.id).order(:title)
	 	   user_id = current_user.id
	 	   @pages = Page.joins("INNER JOIN roles ON roles.page_id = pages.id AND roles.user_id = #{user_id}").order(:title)
	 	   session[:pages] = @pages
	 	 
	 	   #session[:ccc] = "123"
	 	 end
    end
    

  
end
