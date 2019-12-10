# frozen_string_literal: true

class Event < ApplicationRecord
  belongs_to :place
  belongs_to :user
  has_and_belongs_to_many :members, class_name: 'User', dependent: :destroy
  accepts_nested_attributes_for :place
  scope :sort_by_start_time, -> { order(started_at: :desc) }

  validates :name, name_lenght: { minimum: 5 }
  validates :started_at, :duration, presence: true

  def has_member?(user)
    members.include?(user)
  end

  def status
    time = Time.current
    return :incomming if started_at > time
    return :in_progress if time.between?(started_at, finished_at)
    return :finished if started_at < time + duration.hours
  end

  def finished_at
    started_at + duration.hours
  end
end
