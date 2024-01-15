class CreateMasterUserDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :master_user_drinks do |t|
      t.references :user_drink, null: false, foreign_key: true
      t.references :master_drink, null: false, foreign_key: true
      t.integer :alcohol_percentage
      t.integer :alcohol_amount

      t.timestamps
    end
  end
end
