class ApplicationController < ActionController::Base
  include Knock::Authenticable
  protect_from_forgery with: :exception
  include SessionsHelper
  before_action :no_cache

  def no_cache
    response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
    response.headers["Pragma"] = "no-cache"
    response.headers["Expires"] = "Fri, 09 Jan 2004 00:00:00 GMT"
  end
end
