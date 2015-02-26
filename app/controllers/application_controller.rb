class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.


  # write a before filter for current user and for any user that is logged inject
  protect_from_forgery with: :exception
end
