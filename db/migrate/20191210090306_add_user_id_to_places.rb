class AddUserIdToPlaces < ActiveRecord::Migration[5.2]
  def change
    add_reference :places, :user
  end
end