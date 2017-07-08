class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_filter :get_articles

  private
  def configure_permitted_parameters
  	devise_parameter_sanitizer.for(:sign_up) << [:nickname, :college, :faculty, :grade, :gender]
  	devise_parameter_sanitizer.for(:account_update) << [:nickname, :college, :faculty, :grade, :gender]
  end

  def get_articles
    @top_articles = Article.limit(5)
  end
end
