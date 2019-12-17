class ApplicationController < ActionController::Base
  before_action :authenticate_user!
  around_action :switch_locale
  rescue_from CanCan::AccessDenied, with: :unauthorized

  def switch_locale(&action)     
    locale = current_user ? current_user.setting.locale : I18n.default_locale
  
    I18n.with_locale(locale, &action)   
  end

  private

  def unauthorized
    redirect_to root_url, alert: t('.no_access')
  end
end
