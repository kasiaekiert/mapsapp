class Event < ApplicationRecord
  belongs_to :place 
  belongs_to :user
  has_and_belongs_to_many :members, class_name: "User"
  accepts_nested_attributes_for :place

  validates :name, name_lenght: { minimum: 5 }

  def has_member?(user)
    members.include?(user)
  end

  def status
    return '' unless self.started_at
    return 'in_progress' if self.started_at == Time.now
    return 'incomming' if self.started_at > Date.today
    return 'finished' if self.started_at < Date.today
  end
end
