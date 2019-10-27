class Setting < ApplicationRecord
  belongs_to :user

  enum locale: [:en, :pl]

end
