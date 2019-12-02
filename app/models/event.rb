class Event < ApplicationRecord
  belongs_to :place 
  belongs_to :user
  has_and_belongs_to_many :members, class_name: "User"

  validates :name, name_lenght: { minimum: 5 }
  validates_uniqueness_of :members, scope: [:member_id]
end
