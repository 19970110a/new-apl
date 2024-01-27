class AddCharacterToUsers < ActiveRecord::Migration[7.0]
  def change
    add_reference :users, :character, null: true, foreign_key: true
  end
end
