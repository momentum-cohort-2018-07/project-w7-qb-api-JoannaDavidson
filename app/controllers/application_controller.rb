class ApplicationController < ActionController::Base
  include ActionController::HttpAuthentication::Token::ControllerMethods
    protect_from_forgery with: :null_session
    helper_method :current_whiner
    helper_method :logged_in?
    helper_method :token_whiner
    before_action :verify_authentication
    before_action :destroy_session
  
    def verify_authentication
      unless token_whiner
        render json: {error: "You don't have permission to access these resources"}, status: :unauthorized
      end
    end

protected
    def current_whiner
      @current_whiner ||= Whiner.find(session[:whiner_id]) if session[:whiner_id]
    end

    def token_whiner
      @token_whiner ||= authenticate_with_http_token do |token, options|
        Whiner.find_by_api_token(token)
      end
    end

    def logged_in?
      !!current_whiner
    end
end