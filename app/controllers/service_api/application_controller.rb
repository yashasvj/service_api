module ServiceApi
  class ApplicationController < ActionController::Base
  	include ActionController::HttpAuthentication::Basic::ControllerMethods
    protect_from_forgery with: :null_session
  end
end
