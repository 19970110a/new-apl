class ChangeUserIdToBeOptionalInDrinks < ActiveRecord::Migration[7.0]
  def change
    change_column_null :drinks, :user_id, true
  end
end