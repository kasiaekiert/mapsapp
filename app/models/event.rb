class Event < ApplicationRecord
  belongs_to :place
  belongs_to :user

  validates :name, name_length: { greater_than: 8 }
end
