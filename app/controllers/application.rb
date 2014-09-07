# Filters added to this controller apply to all controllers in the application.
# Likewise, all the methods added will be available for all controllers.

class ApplicationController < ActionController::Base
    include ExceptionNotifiable
  # Pick a unique cookie name to distinguish our session data from others'
  session :session_key => '_bfrpg_cg_session_id'
end
