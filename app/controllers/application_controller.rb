class ApplicationController < ActionController::Base
  protect_from_forgery

  before_filter :authenticate_user!
  #before_filter :set_locale

  def set_locale 
    I18n.locale = params[:locale] 
  end 

  #def default_url_options(options={})  
    #logger.debug "default_url_options is passed options: #{options.inspect}\n"  
  #  { :locale => I18n.locale } 
  #end 

  layout :layout_by_resource

  def layout_by_resource
    if devise_controller?
      "session_layout"
    else
      "application"
    end
  end
end
