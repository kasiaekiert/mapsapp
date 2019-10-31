class Event < ApplicationRecord
  belongs_to :place
  has_and_belongs_to_many :members, class_name: "User"
  belongs_to :user

  validates :name, name_lenght: { minimum: 5 }
end
