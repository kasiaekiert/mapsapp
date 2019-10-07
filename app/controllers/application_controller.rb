class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :switch_locale     

  def switch_locale(&action)     
    # I18n.with_locale(:pl, &action)
    locale = params[:locale] || I18n.default_locale     
    I18n.with_locale(:pl, &action)   
  end
end
