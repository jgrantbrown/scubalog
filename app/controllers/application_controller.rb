class ApplicationController < ActionController::Base
  protect_from_forgery with: :exception, prepend: true

helper_method :logged_in?, :current_user

def logged_in?
  !!session[:account_id]
end

def current_user
  Account.find(session[:account_id]) if logged_in?
end

def destroy
  session[:account_id]=nil
  redirect_to root_path
end

def verify_logged_in
  unless logged_in?
    flash[:error]="You must be logged in to do that"
  redirect_to new_session_path
  end
end



end
