class CreateCharacters < ActiveRecord::Migration[7.0]
  def change
    create_table :characters do |t|
      t.string :animal
      
      t.timestamps
    end
  end
end
