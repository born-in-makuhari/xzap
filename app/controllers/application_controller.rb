class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception

  private

  def login?
    return true if Account.find session[:account]
    @login = Account.find session[:account]
  end
end
