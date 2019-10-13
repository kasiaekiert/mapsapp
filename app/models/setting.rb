class Setting < ApplicationRecord
  belongs_to :user

  enum locale: [:en, :pl]

  validates :locale, inclusion: { in: ['en', 'pl']}

  def deafault_locale
    if current_user.setting == nil
      config.i18n.default_locale = :pl
    end
  end 
end
