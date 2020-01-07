class Event < ApplicationRecord
  belongs_to :place 
  belongs_to :user
  has_and_belongs_to_many :members, class_name: "User"
  accepts_nested_attributes_for :place

  validates :name, name_lenght: { minimum: 5 }
  validates :started_at, :duration, presence: true

  def has_member?(user)
    members.include?(user)
  end

  def status
    return :incomming if started_at > Time.current
    return :in_progress if Time.current.between?(started_at, started_at+duration.hours)
    return :finished if started_at < Time.current + duration.hours
    end
    
end
