class CreateSettings < ActiveRecord::Migration[5.2]
  def change
    create_table :settings do |t|
      t.integer :locale
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
