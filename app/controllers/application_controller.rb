class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  #before_filter :set_locale

  layout :layout_by_resource
  before_filter { Authorization.current_user = current_user }  

  def set_locale 
    I18n.locale = params[:locale] 
  end 

  #def default_url_options(options={})  
  #  logger.debug "default_url_options is passed options: #{options.inspect}\n"  
  #  { :locale => I18n.locale } 
  #end 

  def layout_by_resource
    if devise_controller?
      "session_layout"
    else
      "application"
    end
  end

  protected
  def permission_denied
    flash[:error] = "Sorry, you not allowed to access that page."  

    redirect_to :blogs
  end 
end
