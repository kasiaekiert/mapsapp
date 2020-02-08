# frozen_string_literal: true

class User < ApplicationRecord
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_and_belongs_to_many :events
  has_many :owned_events, class_name: 'Event'
  has_one :setting
  has_many :created_places, class_name: 'Place'
end
