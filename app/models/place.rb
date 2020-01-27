class Place < ApplicationRecord
  has_many :events
  belongs_to :creator, class_name: 'User', foreign_key: 'user_id'
  def full_adress
    [name, '-', address].join(' ')
  end
end
