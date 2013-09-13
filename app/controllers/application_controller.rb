class ApplicationController < ActionController::Base
  protect_from_forgery
  before_filter :authenticate_user!
  
  include ::SslRequirement
  ssl_allowed :all

end
