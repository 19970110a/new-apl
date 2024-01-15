class CreateMasterDrinks < ActiveRecord::Migration[7.0]
  def change
    create_table :master_drinks do |t|
      t.string :select_drink
      t.binary :drink_image
      t.integer :alcohol_percentage
      t.integer :alcohol_amount

      t.timestamps
    end
  end
end
