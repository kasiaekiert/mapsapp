class Event < ApplicationRecord
  belongs_to :place 
  belongs_to :user
  has_and_belongs_to_many :members, class_name: 'User'
  accepts_nested_attributes_for :place

  validates :name, name_lenght: { minimum: 5 }

  def has_member?(user)
    members.include?(user)
  end
end
