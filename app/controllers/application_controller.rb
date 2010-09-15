class ApplicationController < ActionController::Base
  protect_from_forgery

  private

  def authenticate
    return true
  end

end
