class CreateCharacterBodies < ActiveRecord::Migration[7.0]
  def change
    create_table :character_bodies do |t|
      t.references :character, null: false, foreign_key: true
      t.binary :character_image
      t.integer :character_kg
      t.string :character_body_type

      t.timestamps
    end
  end
end
