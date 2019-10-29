class Event < ApplicationRecord
  belongs_to :place
  has_and_belongs_to_many :users

  validates :name, name_lenght: { minimum: 5 }
end
