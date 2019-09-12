class Place < ApplicationRecord
  has_many :events
  
  def full_adress
    [name, "-", address].join(" ")
  end

end
