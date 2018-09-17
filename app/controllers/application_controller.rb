class ApplicationController < ActionController::Base
    helper_method :current_whiner
    helper_method :logged_in?
  
protected
    def current_whiner
      @current_whiner ||= Whiner.find(session[:whiner_id]) if session[:whiner_id]
    end

    def logged_in?
      !!current_whiner
    end
end
