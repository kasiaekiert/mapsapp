class Event < ApplicationRecord
  belongs_to :place 
  belongs_to :user
<<<<<<< HEAD
  has_and_belongs_to_many :members, class_name: "User", dependent: :destroy 
=======
  has_and_belongs_to_many :members, class_name: "User"
  accepts_nested_attributes_for :place
>>>>>>> 8061266ad2cad7e517e5965faec4fc6a01cc1909

  validates :name, name_lenght: { minimum: 5 }

  def has_member?(user)
    members.include?(user)
  end

  def before_destroy
    if event.has_member?
      flash[:notice] = "There are some members in your event. Are you sure that you want to remove it?"
    else
      flash[:notice] = "Are you sure?"
    end
  end
end
