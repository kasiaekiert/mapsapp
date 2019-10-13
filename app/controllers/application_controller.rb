class ApplicationController < ActionController::Base
  before_action :authenticate_user!

  def switch_locale(&action)     
    locale = if current_user
      current_user.setting.locale || I18n.default_locale 
    else
      I18n.default_locale
    end

    I18n.with_locale(locale, &action)   
  end
end
