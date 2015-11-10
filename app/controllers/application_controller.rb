class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  #http_basic_authenticate_with name: "admin", password: "password"
  skip_before_filter :verify_authenticity_token
  before_action  :authenticate , except: [:root_path]
  #before_action :check_flexmod_connection
 
  protected
  
  def authenticate
    p session[:role]
    authenticate_or_request_with_http_basic "Wrong Username or Password" do |username, password|
      if ConfigurationKey.where(key:username).exists? 
        configuration_key = ConfigurationKey.find_by! key:username, section:'password'
        
#        unless configuration_key.value != password
#        end
        if configuration_key.value == password
          session[:role] = username
          true
        else
          render :file => "public/401.html", :status => :unauthorized
        end
      end
    end
  end
  
  def authenticates
    authenticate_or_request_with_http_basic do |username, password|
      if(username == "abc" && password == "123")
        true
      else
        reset_session
        redirect_to root_path
      end
    end
  end
  
  def check_flexmod_connection
    render :file => "public/not_connected.html" unless Flexgem::Comm.flexmod_connected
  end
end
