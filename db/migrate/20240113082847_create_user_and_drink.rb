class CreateUserAndDrink < ActiveRecord::Migration[7.0]
  def change
    create_table :user_and_drinks do |t|
      t.references :user, null: false, foreign_key: true
      t.references :master_user_drink, null: false, foreign_key: true
      t.date :drink_date

      t.timestamps
    end
  end
end
