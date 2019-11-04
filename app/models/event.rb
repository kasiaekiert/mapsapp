class Event < ApplicationRecord
  belongs_to :place
  belongs_to :user

  #validates :name, name_lenght: { minimum: 5 }
end
